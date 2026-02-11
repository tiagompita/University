#!/usr/bin/env python3

import argparse
import json
import os
import random
import re
import shutil
import signal
import socket
import statistics
import subprocess
import sys
import time
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Optional

try:
    # Prefer reading the game's configured timeout rather than hardcoding.
    from consts import TIMEOUT as GAME_TIMEOUT_FRAMES  # type: ignore
except Exception:
    GAME_TIMEOUT_FRAMES = 3600


SCORE_RE = re.compile(r"\[\d+\]\s+SCORE:\s+(\d+)")

FRAME_PREFIX_RE = re.compile(r"^\s*Frame\s+(\d+)\s+-")
KILLED_BY_RE = re.compile(r"BugBlaster\s+was\s+killed\s+by\s+(centipede|spider|flee)\b", re.IGNORECASE)
GAME_OVER_RE = re.compile(r"\bGAME\s+OVER\b", re.IGNORECASE)


@dataclass(frozen=True)
class RunResult:
    run_index: int
    seed: int
    port: int
    score: Optional[int]
    end_reason: Optional[str]
    end_frame: Optional[int]
    duration_s: float
    run_dir: Path


def _pick_free_port() -> int:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind(("127.0.0.1", 0))
        return int(s.getsockname()[1])


def _wait_for_port(host: str, port: int, timeout_s: float) -> bool:
    deadline = time.time() + timeout_s
    while time.time() < deadline:
        try:
            with socket.create_connection((host, port), timeout=0.25):
                return True
        except OSError:
            time.sleep(0.05)
    return False


def _terminate_process(proc: subprocess.Popen, timeout_s: float = 3.0) -> None:
    if proc.poll() is not None:
        return

    try:
        proc.terminate()
    except Exception:
        pass

    try:
        proc.wait(timeout=timeout_s)
        return
    except subprocess.TimeoutExpired:
        pass

    try:
        proc.kill()
    except Exception:
        pass

    try:
        proc.wait(timeout=timeout_s)
    except subprocess.TimeoutExpired:
        pass


def _extract_score_from_game_log(game_log_path: Path) -> Optional[int]:
    if not game_log_path.exists():
        return None

    last_score: Optional[int] = None
    try:
        with game_log_path.open("r", encoding="utf-8", errors="replace") as f:
            for line in f:
                m = SCORE_RE.search(line)
                if m:
                    last_score = int(m.group(1))
    except Exception:
        return None

    return last_score


def _extract_end_reason_from_game_log(game_log_path: Path, timeout_frames: int) -> tuple[Optional[str], Optional[int]]:
    """Infer why the game ended using the game's own logs.

    Expected patterns (game.py):
      - "BugBlaster was killed by centipede <...>"
      - "BugBlaster was killed by flee at (...)"
      - "BugBlaster was killed by spider at (...)"
      - "GAME OVER" at frame == TIMEOUT for timeout endings
    """
    if not game_log_path.exists():
        return (None, None)

    last_frame: Optional[int] = None
    game_over_frame: Optional[int] = None
    killed_by: Optional[str] = None
    killed_frame: Optional[int] = None

    try:
        with game_log_path.open("r", encoding="utf-8", errors="replace") as f:
            for line in f:
                m_frame = FRAME_PREFIX_RE.search(line)
                if m_frame:
                    try:
                        last_frame = int(m_frame.group(1))
                    except Exception:
                        pass

                m_kill = KILLED_BY_RE.search(line)
                if m_kill:
                    killed_by = m_kill.group(1).lower()
                    killed_frame = last_frame

                if GAME_OVER_RE.search(line):
                    game_over_frame = last_frame
    except Exception:
        return (None, None)

    if killed_by is not None:
        return (killed_by, killed_frame)

    if game_over_frame is not None:
        if isinstance(timeout_frames, int) and timeout_frames > 0 and game_over_frame >= timeout_frames:
            return ("timeout", game_over_frame)
        return ("game_over", game_over_frame)

    # No explicit game-over marker found (e.g., benchmark killed the agent early).
    return ("unknown", last_frame)


def _write_json(path: Path, data) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)


def run_one(
    run_index: int,
    seed: int,
    name: str,
    server_py: Path,
    student_py: Path,
    viewer_py: Path,
    viewer_enabled: bool,
    viewer_scale: int,
    out_root: Path,
    server_start_timeout_s: float,
    max_run_seconds: Optional[float],
) -> RunResult:
    run_dir = out_root / f"run_{run_index:02d}_seed_{seed}"
    run_dir.mkdir(parents=True, exist_ok=True)

    port = _pick_free_port()

    server_stdout = (run_dir / "server_stdout.txt").open("w", encoding="utf-8")
    server_stderr = (run_dir / "server_stderr.txt").open("w", encoding="utf-8")

    server_cmd = [
        sys.executable,
        str(server_py),
        "--bind",
        "127.0.0.1",
        "--port",
        str(port),
        "--seed",
        str(seed),
        "--grading-server",
        "",
    ]

    t0 = time.time()
    server_proc = subprocess.Popen(
        server_cmd,
        stdout=server_stdout,
        stderr=server_stderr,
        cwd=str(server_py.parent),
        env={**os.environ},
    )

    viewer_proc: Optional[subprocess.Popen] = None

    try:
        if not _wait_for_port("127.0.0.1", port, server_start_timeout_s):
            raise RuntimeError(f"server did not start listening on port {port}")

        if viewer_enabled:
            has_display = bool(os.environ.get("DISPLAY") or os.environ.get("WAYLAND_DISPLAY"))
            if not has_display:
                raise RuntimeError("--viewer requested but no DISPLAY/WAYLAND_DISPLAY is set")

            viewer_env = {
                **os.environ,
                "SERVER": "127.0.0.1",
                "PORT": str(port),
            }
            viewer_stdout = (run_dir / "viewer_stdout.txt").open("w", encoding="utf-8")
            viewer_stderr = (run_dir / "viewer_stderr.txt").open("w", encoding="utf-8")
            viewer_cmd = [sys.executable, str(viewer_py), "--server", "127.0.0.1", "--port", str(port)]
            if isinstance(viewer_scale, int) and viewer_scale > 0:
                viewer_cmd += ["--scale", str(viewer_scale)]

            viewer_proc = subprocess.Popen(
                viewer_cmd,
                stdout=viewer_stdout,
                stderr=viewer_stderr,
                cwd=str(viewer_py.parent),
                env=viewer_env,
            )

        agent_env = {
            **os.environ,
            "SERVER": "127.0.0.1",
            "PORT": str(port),
            "NAME": name,
        }

        agent_stdout = (run_dir / "agent_stdout.txt").open("w", encoding="utf-8")
        agent_stderr = (run_dir / "agent_stderr.txt").open("w", encoding="utf-8")

        agent_cmd = [sys.executable, str(student_py)]
        agent_proc = subprocess.Popen(
            agent_cmd,
            stdout=agent_stdout,
            stderr=agent_stderr,
            cwd=str(student_py.parent),
            env=agent_env,
        )

        try:
            agent_proc.wait(timeout=max_run_seconds)
        except subprocess.TimeoutExpired:
            # Stop run early if requested.
            _terminate_process(agent_proc)

    finally:
        # Copy logs generated by the game/server into the run folder.
        repo_root = server_py.parent
        for filename in ["game_log.txt", "server_log.txt", "highscores.json"]:
            src = repo_root / filename
            if src.exists():
                try:
                    shutil.copy2(src, run_dir / filename)
                except Exception:
                    pass

        _terminate_process(server_proc)
        if viewer_proc is not None:
            _terminate_process(viewer_proc)

        try:
            server_stdout.close()
        except Exception:
            pass
        try:
            server_stderr.close()
        except Exception:
            pass

    duration_s = time.time() - t0
    score = _extract_score_from_game_log(run_dir / "game_log.txt")

    end_reason, end_frame = _extract_end_reason_from_game_log(
        run_dir / "game_log.txt",
        timeout_frames=int(GAME_TIMEOUT_FRAMES) if isinstance(GAME_TIMEOUT_FRAMES, int) else 3600,
    )

    return RunResult(
        run_index=run_index,
        seed=seed,
        port=port,
        score=score,
        end_reason=end_reason,
        end_frame=end_frame,
        duration_s=duration_s,
        run_dir=run_dir,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description="Run Centopeia benchmark N times.")
    parser.add_argument("--runs", type=int, default=30)
    parser.add_argument("--name", type=str, default="benchmark")
    parser.add_argument(
        "--viewer",
        action="store_true",
        help="Start viewer.py connected to each run so you can watch.",
    )
    parser.add_argument(
        "--viewer-scale",
        type=int,
        default=1,
        help="Viewer scale argument (same as viewer.py --scale).",
    )
    parser.add_argument(
        "--out",
        type=str,
        default="benchmarks",
        help="Output folder (default: benchmarks)",
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=0,
        help="Base seed. If 0, uses a random base seed.",
    )
    parser.add_argument(
        "--server-start-timeout",
        type=float,
        default=5.0,
        help="Seconds to wait for server to listen.",
    )
    parser.add_argument(
        "--max-run-seconds",
        type=float,
        default=0.0,
        help="If >0, kill agent after this many seconds (score may be partial).",
    )

    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parent
    server_py = repo_root / "server.py"
    student_py = repo_root / "student.py"
    viewer_py = repo_root / "viewer.py"

    if not server_py.exists() or not student_py.exists() or not viewer_py.exists():
        print("Error: expected server.py, student.py, and viewer.py next to this script.", file=sys.stderr)
        return 2

    base_seed = args.seed if args.seed != 0 else random.randint(1, 2_147_483_647)

    stamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    out_root = (repo_root / args.out / stamp).resolve()
    out_root.mkdir(parents=True, exist_ok=True)

    meta = {
        "runs": args.runs,
        "name": args.name,
        "base_seed": base_seed,
        "started_at": stamp,
        "python": sys.executable,
    }
    _write_json(out_root / "meta.json", meta)

    results: list[RunResult] = []
    max_run_seconds = args.max_run_seconds if args.max_run_seconds > 0 else None

    for i in range(1, args.runs + 1):
        seed = base_seed + i
        print(f"Run {i}/{args.runs} (seed={seed})...", flush=True)
        try:
            res = run_one(
                run_index=i,
                seed=seed,
                name=args.name,
                server_py=server_py,
                student_py=student_py,
                viewer_py=viewer_py,
                viewer_enabled=bool(args.viewer),
                viewer_scale=int(args.viewer_scale),
                out_root=out_root,
                server_start_timeout_s=args.server_start_timeout,
                max_run_seconds=max_run_seconds,
            )
        except KeyboardInterrupt:
            print("Interrupted.")
            break
        except Exception as e:
            print(f"Run {i} failed: {e}", file=sys.stderr)
            res = RunResult(
                i,
                seed,
                port=-1,
                score=None,
                end_reason="error",
                end_frame=None,
                duration_s=0.0,
                run_dir=out_root / f"run_{i:02d}_seed_{seed}",
            )

        results.append(res)
        print(
            f"  score={res.score} end={res.end_reason}@{res.end_frame} duration={res.duration_s:.1f}s logs={res.run_dir}",
            flush=True,
        )

    scores = [r.score for r in results if isinstance(r.score, int)]
    end_reason_counts: dict[str, int] = {}
    for r in results:
        if isinstance(r.end_reason, str) and r.end_reason:
            end_reason_counts[r.end_reason] = end_reason_counts.get(r.end_reason, 0) + 1

    summary = {
        "total_runs": len(results),
        "completed_scores": len(scores),
        "average_score": (statistics.mean(scores) if scores else None),
        "min_score": (min(scores) if scores else None),
        "max_score": (max(scores) if scores else None),
        "end_reasons": end_reason_counts,
        "top3": [],
        "bottom3": [],
        "runs": [
            {
                "run": r.run_index,
                "seed": r.seed,
                "port": r.port,
                "score": r.score,
                "end_reason": r.end_reason,
                "end_frame": r.end_frame,
                "duration_s": r.duration_s,
                "dir": str(r.run_dir),
            }
            for r in results
        ],
    }

    sorted_valid = sorted([r for r in results if isinstance(r.score, int)], key=lambda r: r.score)
    summary["bottom3"] = [
        {"run": r.run_index, "seed": r.seed, "score": r.score, "dir": str(r.run_dir)}
        for r in sorted_valid[:3]
    ]
    summary["top3"] = [
        {"run": r.run_index, "seed": r.seed, "score": r.score, "dir": str(r.run_dir)}
        for r in sorted_valid[-3:][::-1]
    ]

    _write_json(out_root / "summary.json", summary)

    print("\nSummary:")
    print(f"  runs: {summary['total_runs']} (scores: {summary['completed_scores']})")
    print(f"  average: {summary['average_score']}")
    print(f"  min: {summary['min_score']}  max: {summary['max_score']}")
    if summary.get("end_reasons"):
        print("  end_reasons:")
        for k, v in sorted(summary["end_reasons"].items(), key=lambda kv: (-kv[1], kv[0])):
            print(f"    {k}: {v}")
    print("  top3:")
    for r in summary["top3"]:
        print(f"    run {r['run']:02d} seed={r['seed']} score={r['score']} ({r['dir']})")
    print("  bottom3:")
    for r in summary["bottom3"]:
        print(f"    run {r['run']:02d} seed={r['seed']} score={r['score']} ({r['dir']})")

    print(f"\nWrote: {out_root / 'summary.json'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
