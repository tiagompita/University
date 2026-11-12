#!/usr/bin/env python3
"""Valida os ficheiros de testes em quiz/tests (estrutura e unicidade das perguntas)."""
import json
import re
import sys
from pathlib import Path

TESTS_DIR = Path(__file__).resolve().parent / "tests"
BANNED = re.compile(r"\b(todas|nenhuma|ambas)\b.*\b(anteriores|acima|opções)\b", re.I)

# nº esperado de perguntas por ficheiro
EXPECTED = {
    "1-introduction": 10, "2-vulnerabilities": 10, "3.1-digest": 8, "3.2-key-derivation": 8,
    "3.3-symmetric": 12, "3.4-asymmetric": 10, "3.5-mac": 6, "3.6-signatures": 6,
    "4-pki": 10, "5-authentication": 12,
    **{f"global-{i}": 20 for i in range(1, 6)},
}


def norm(text):
    return re.sub(r"\W+", " ", text.lower()).strip()


def main():
    errors = []
    seen = {}
    total = 0
    files = sorted(TESTS_DIR.glob("*.json"), key=lambda p: p.stem)
    stems = {p.stem for p in files}
    for missing in sorted(set(EXPECTED) - stems):
        errors.append(f"falta o ficheiro {missing}.json")
    for p in files:
        try:
            data = json.loads(p.read_text(encoding="utf-8"))
        except json.JSONDecodeError as e:
            errors.append(f"{p.name}: JSON inválido ({e})")
            continue
        qs = data.get("questions", [])
        if not data.get("title"):
            errors.append(f"{p.name}: falta 'title'")
        if p.stem in EXPECTED and len(qs) != EXPECTED[p.stem]:
            errors.append(f"{p.name}: {len(qs)} perguntas (esperado {EXPECTED[p.stem]})")
        total += len(qs)
        for n, q in enumerate(qs, 1):
            where = f"{p.name} #{n}"
            opts = q.get("options", [])
            if not q.get("q"):
                errors.append(f"{where}: pergunta vazia")
            if len(opts) != 4:
                errors.append(f"{where}: {len(opts)} opções (precisa de 4)")
            if len({" ".join(o.lower().split()) for o in opts}) != len(opts):
                errors.append(f"{where}: opções repetidas")
            if not isinstance(q.get("answer"), int) or not 0 <= q["answer"] < len(opts):
                errors.append(f"{where}: 'answer' inválido")
            if any(BANNED.search(o) for o in opts):
                errors.append(f"{where}: opção do tipo 'todas/nenhuma das anteriores'")
            if not q.get("explanation"):
                errors.append(f"{where}: falta 'explanation'")
            if not q.get("ref"):
                errors.append(f"{where}: falta 'ref'")
            key = norm(q.get("q", ""))
            if key in seen:
                errors.append(f"{where}: pergunta repetida (já em {seen[key]})")
            seen[key] = where
        print(f"{p.stem:<22} {len(qs):>3} perguntas")
    print(f"{'TOTAL':<22} {total:>3} perguntas em {len(files)} ficheiros")
    for e in errors:
        print("ERRO:", e)
    print("OK" if not errors else f"{len(errors)} erro(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
