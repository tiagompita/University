#!/usr/bin/env python3
"""Testes de escolha múltipla de SIC no terminal.

Uso:
    python quiz/quiz.py              menu com todos os testes
    python quiz/quiz.py 3.3          teste do documento 3.3
    python quiz/quiz.py global-2     segundo teste global
    python quiz/quiz.py --no-shuffle 5   não baralha as opções

Teclas:  ↑ ↓ mover   ESPAÇO escolher   ← → pergunta anterior/seguinte
         ENTER terminar (na última pergunta)   ESC / q sair
"""
import json
import os
import random
import shutil
import sys
import textwrap
from pathlib import Path

TESTS_DIR = Path(__file__).resolve().parent / "tests"

UP, DOWN, LEFT, RIGHT, SPACE, ENTER, ESC = "UP", "DOWN", "LEFT", "RIGHT", "SPACE", "ENTER", "ESC"

BOLD, DIM, RESET = "\033[1m", "\033[2m", "\033[0m"
CYAN, GREEN, RED, YELLOW = "\033[36m", "\033[32m", "\033[31m", "\033[33m"
LETTERS = "ABCD"


# --------------------------------------------------------------------------- teclado

if os.name == "nt":
    import msvcrt

    _WIN_KEYS = {"H": UP, "P": DOWN, "K": LEFT, "M": RIGHT}

    def read_key():
        ch = msvcrt.getwch()
        if ch in ("\x00", "\xe0"):
            return _WIN_KEYS.get(msvcrt.getwch(), "")
        if ch == "\x03":
            raise KeyboardInterrupt
        return {" ": SPACE, "\r": ENTER, "\n": ENTER, "\x1b": ESC}.get(ch, ch)
else:
    import select
    import termios
    import tty

    _POSIX_KEYS = {"A": UP, "B": DOWN, "D": LEFT, "C": RIGHT}

    def read_key():
        fd = sys.stdin.fileno()
        old = termios.tcgetattr(fd)
        try:
            tty.setcbreak(fd)
            ch = sys.stdin.read(1)
            if ch == "\x1b":
                if select.select([sys.stdin], [], [], 0.05)[0]:
                    seq = sys.stdin.read(2)
                    return _POSIX_KEYS.get(seq[-1], "")
                return ESC
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old)
        return {" ": SPACE, "\r": ENTER, "\n": ENTER}.get(ch, ch)


# --------------------------------------------------------------------------- ecrã

def width():
    return max(40, min(100, shutil.get_terminal_size((80, 24)).columns - 2))


def clear():
    sys.stdout.write("\033[2J\033[H")


def wrap(text, indent="", first=None):
    return textwrap.fill(text, width(), initial_indent=first if first is not None else indent,
                         subsequent_indent=indent)


def bar(done, total, size=20):
    filled = round(size * done / total) if total else 0
    return "█" * filled + "░" * (size - filled)


# --------------------------------------------------------------------------- testes

def load_test(path, shuffle=True):
    data = json.loads(Path(path).read_text(encoding="utf-8"))
    questions = []
    for q in data["questions"]:
        order = list(range(len(q["options"])))
        if shuffle:
            random.shuffle(order)
        questions.append({
            "q": q["q"],
            "options": [q["options"][i] for i in order],
            "answer": order.index(q["answer"]),
            "explanation": q.get("explanation", ""),
            "ref": q.get("ref", ""),
        })
    return {"title": data["title"], "questions": questions}


def list_tests():
    return sorted(TESTS_DIR.glob("*.json"), key=lambda p: p.stem)


def find_test(arg):
    for p in list_tests():
        if arg == p.stem or ("global" not in p.stem and arg == p.stem.split("-")[0]):
            return p
    return None


def title_of(path):
    return json.loads(path.read_text(encoding="utf-8"))["title"], \
        len(json.loads(path.read_text(encoding="utf-8"))["questions"])


# --------------------------------------------------------------------------- menu

def menu():
    tests = list_tests()
    cursor = 0
    infos = [title_of(p) for p in tests]
    while True:
        clear()
        print(f"{BOLD}{CYAN}SIC — Testes de escolha múltipla{RESET}\n")
        for i, (title, n) in enumerate(infos):
            sel = i == cursor
            line = f"{'▶' if sel else ' '} {title}  ({n} perguntas)"
            print(f"{BOLD}{CYAN}{line}{RESET}" if sel else line)
            if tests[i].stem == "5-authentication":
                print()
        print(f"\n{DIM}↑↓ mover   ESPAÇO/ENTER abrir   q sair{RESET}")
        key = read_key()
        if key == UP:
            cursor = (cursor - 1) % len(tests)
        elif key == DOWN:
            cursor = (cursor + 1) % len(tests)
        elif key in (SPACE, ENTER):
            return tests[cursor]
        elif key in ("q", ESC):
            return None


# --------------------------------------------------------------------------- pergunta

def draw_question(test, i, answers, cursor):
    qs = test["questions"]
    n = len(qs)
    clear()
    done = sum(a is not None for a in answers)
    print(f"{BOLD}{CYAN}{test['title']}{RESET}")
    print(f"{DIM}Pergunta {i + 1}/{n}   {bar(done, n)} {done}/{n} respondidas{RESET}\n")
    print(BOLD + wrap(qs[i]["q"]) + RESET + "\n")
    for k, opt in enumerate(qs[i]["options"]):
        pointer = "▶" if k == cursor else " "
        mark = "[x]" if answers[i] == k else "[ ]"
        prefix = f" {pointer} {mark} {LETTERS[k]}) "
        text = wrap(opt, indent=" " * len(prefix), first=prefix)
        if answers[i] == k:
            print(GREEN + BOLD + text + RESET)
        elif k == cursor:
            print(BOLD + text + RESET)
        else:
            print(text)
    last = i == n - 1
    hint = "↑↓ mover   ESPAÇO escolher   ← anterior   " + \
        ("→/ENTER terminar" if last else "→ seguinte") + "   ESC sair"
    print(f"\n{DIM}{hint}{RESET}")


def confirm(message):
    print(f"\n{YELLOW}{message} (s/n){RESET}")
    while True:
        key = read_key()
        if key in ("s", "S", "y", "Y"):
            return True
        if key in ("n", "N", ESC, ENTER):
            return False


def summary(test, answers):
    """Devolve (True, None) para terminar ou (False, índice a que voltar)."""
    qs = test["questions"]
    n = len(qs)
    missing = [i for i, a in enumerate(answers) if a is None]
    clear()
    print(f"{BOLD}{CYAN}{test['title']} — resumo{RESET}\n")
    print(f"Respondidas: {n - len(missing)}/{n}")
    if missing:
        print(f"{YELLOW}Sem resposta: {', '.join(str(i + 1) for i in missing)}{RESET}")
        print(f"\n{DIM}← voltar à primeira sem resposta   ENTER terminar mesmo assim{RESET}")
    else:
        print(f"\n{DIM}← voltar às perguntas   ENTER terminar e ver a nota{RESET}")
    while True:
        key = read_key()
        if key == ENTER:
            return True, None
        if key in (LEFT, ESC):
            return False, (missing[0] if missing else n - 1)


def run_questions(test):
    """Devolve a lista de respostas (índice ou None), ou None se o utilizador desistiu."""
    qs = test["questions"]
    n = len(qs)
    answers = [None] * n
    cursors = [0] * n
    i = 0
    while True:
        draw_question(test, i, answers, cursors[i])
        key = read_key()
        if key == UP:
            cursors[i] = (cursors[i] - 1) % 4
        elif key == DOWN:
            cursors[i] = (cursors[i] + 1) % 4
        elif key == SPACE:
            answers[i] = cursors[i]
        elif key == LEFT:
            i = max(0, i - 1)
        elif key == RIGHT or key == ENTER and i == n - 1:
            if i < n - 1:
                i += 1
            else:
                finished, back = summary(test, answers)
                if finished:
                    return answers
                i = back
        elif key in ("q", ESC):
            if confirm("Sair do teste sem ver a nota?"):
                return None


# --------------------------------------------------------------------------- resultados

def results(test, answers):
    qs = test["questions"]
    n = len(qs)
    wrong = [i for i in range(n) if answers[i] != qs[i]["answer"]]
    score = n - len(wrong)
    clear()
    colour = GREEN if score / n >= 0.5 else RED
    print(f"{BOLD}{CYAN}{test['title']} — resultado{RESET}\n")
    print(f"{BOLD}{colour}Nota: {score}/{n}  ({100 * score / n:.0f}%){RESET}\n")
    for i in range(n):
        ok = i not in wrong
        mark = f"{GREEN}✔{RESET}" if ok else f"{RED}✘{RESET}"
        print(f" {mark} {i + 1:>2}. {textwrap.shorten(qs[i]['q'], width() - 8, placeholder='…')}")
    if not wrong:
        print(f"\n{GREEN}Sem erros. Excelente!{RESET}")
        print(f"\n{DIM}Prima uma tecla para continuar{RESET}")
        read_key()
        return
    print(f"\n{DIM}ENTER rever os erros   ESC sair{RESET}")
    if read_key() in (ESC, "q"):
        return
    review(test, answers, wrong)


def review(test, answers, wrong):
    qs = test["questions"]
    pos = 0
    while True:
        i = wrong[pos]
        q = qs[i]
        clear()
        print(f"{BOLD}{CYAN}Revisão — erro {pos + 1}/{len(wrong)}  (pergunta {i + 1}){RESET}\n")
        print(BOLD + wrap(q["q"]) + RESET + "\n")
        for k, opt in enumerate(q["options"]):
            prefix = f"   {LETTERS[k]}) "
            text = wrap(opt, indent=" " * len(prefix), first=prefix)
            if k == q["answer"]:
                print(GREEN + BOLD + text + "   ← certa" + RESET)
            elif k == answers[i]:
                print(RED + text + "   ← a tua resposta" + RESET)
            else:
                print(text)
        if answers[i] is None:
            print(f"\n{RED}   (sem resposta){RESET}")
        if q["explanation"]:
            print("\n" + wrap(q["explanation"], indent="  ", first="💡 "))
        if q["ref"]:
            print(f"{DIM}   Fonte: {q['ref']}{RESET}")
        print(f"\n{DIM}← → navegar   ESC/ENTER sair da revisão{RESET}")
        key = read_key()
        if key == LEFT:
            pos = max(0, pos - 1)
        elif key == RIGHT:
            pos = min(len(wrong) - 1, pos + 1)
        elif key in (ESC, ENTER, "q"):
            return


# --------------------------------------------------------------------------- main

def play(path, shuffle):
    test = load_test(path, shuffle)
    answers = run_questions(test)
    if answers is not None:
        results(test, answers)


def main(argv):
    if os.name == "nt":
        os.system("")  # ativa sequências ANSI no terminal do Windows
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    shuffle = "--no-shuffle" not in argv
    args = [a for a in argv if not a.startswith("--")]
    try:
        if args:
            path = find_test(args[0])
            if path is None:
                names = ", ".join(p.stem for p in list_tests())
                print(f"Teste '{args[0]}' não encontrado. Disponíveis: {names}")
                return 1
            play(path, shuffle)
        else:
            while True:
                path = menu()
                if path is None:
                    break
                play(path, shuffle)
    except KeyboardInterrupt:
        pass
    finally:
        clear()
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
