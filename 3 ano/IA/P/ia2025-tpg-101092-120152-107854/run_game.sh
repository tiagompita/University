#!/bin/bash

echo "========================================"
echo "   Iniciando Centipede Game"
echo "========================================"
echo ""

# Diretório do script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VENV_DIR="$SCRIPT_DIR/.venv"

# Verificar se o venv existe, caso contrário, criar
if [ ! -d "$VENV_DIR" ]; then
    echo "Criando ambiente virtual..."
    python3 -m venv "$VENV_DIR"
    if [ $? -ne 0 ]; then
        echo "ERRO: Falha ao criar ambiente virtual!"
        exit 1
    fi
fi

# Ativar o ambiente virtual
echo "Ativando ambiente virtual..."
source "$VENV_DIR/bin/activate"

# Instalar dependências do projeto (inclui requests, aiohttp, pygame, websockets, etc.)
echo "Instalando/verificando dependencias (requirements.txt)..."
python -m pip install -r "$SCRIPT_DIR/requirements.txt"
if [ $? -ne 0 ]; then
    echo "ERRO: Falha ao instalar dependencias via requirements.txt!"
    deactivate
    exit 1
fi
echo ""

cleanup() {
    # Matar processos do servidor e viewer (se existirem)
    if [ -n "${SERVER_PID:-}" ]; then
        kill "$SERVER_PID" 2>/dev/null
    fi
    if [ -n "${VIEWER_PID:-}" ]; then
        kill "$VIEWER_PID" 2>/dev/null
    fi
}

trap cleanup EXIT INT TERM

wait_for_port() {
    local host="$1"
    local port="$2"
    local timeout_s="$3"
    python - <<PY
import socket, time, sys
host = "${host}"
port = int("${port}")
timeout = float("${timeout_s}")
start = time.time()
while time.time() - start < timeout:
    try:
        with socket.create_connection((host, port), timeout=0.2):
            sys.exit(0)
    except OSError:
        time.sleep(0.2)
sys.exit(1)
PY
}

# Iniciar o servidor (mesmo terminal) - evita problemas de permissões do macOS/osascript
echo "[1/3] Iniciando servidor..."
python server.py > server_output.log 2>&1 &
SERVER_PID=$!

echo "Aguardando servidor em localhost:8000..."
wait_for_port "127.0.0.1" "8000" "10"
if [ $? -ne 0 ]; then
    echo "ERRO: Servidor nao iniciou em localhost:8000. Veja server_output.log"
    echo "--- Ultimas linhas de server_output.log ---"
    tail -n 50 server_output.log 2>/dev/null || true
    exit 1
fi

# Iniciar o viewer (mesmo terminal)
echo "[2/3] Iniciando viewer..."
python viewer.py > viewer_output.log 2>&1 &
VIEWER_PID=$!
sleep 1

# Iniciar o agente (student) e aguardar terminar
echo "[3/3] Iniciando agente..."
echo ""
python student.py

# Quando student terminar, fechar os processos do servidor e viewer
echo ""
echo "========================================"
echo "   Agente terminou"
echo "   A mostrar highscores por alguns segundos..."
echo "========================================"

# Give the viewer time to render the scoreboard/highscores before cleanup kills it.
# Override with SCOREBOARD_WAIT_SECONDS=0 to skip waiting.
SCOREBOARD_WAIT_SECONDS="${SCOREBOARD_WAIT_SECONDS:-5}"
if [ "${SCOREBOARD_WAIT_SECONDS}" -gt 0 ] 2>/dev/null; then
    sleep "${SCOREBOARD_WAIT_SECONDS}"
fi

# cleanup() via trap will terminate them

# Desativar o ambiente virtual
deactivate

echo ""
echo "Todos os processos foram encerrados."
echo ""

