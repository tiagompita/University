@echo off
echo ========================================
echo   Iniciando Centipede Game
echo ========================================
echo.

REM Verificar e instalar dependencias se necessario
echo Verificando dependencias...
python -c "import pygame, websockets" 2>nul
if errorlevel 1 (
    echo Instalando dependencias necessarias...
    python -m pip install --quiet pygame websockets
    if errorlevel 1 (
        echo ERRO: Falha ao instalar dependencias!
        pause
        exit /b 1
    )
    echo Dependencias instaladas com sucesso!
)
echo.

REM Iniciar o servidor em nova janela
echo [1/3] Iniciando servidor...
start "Centipede Server" cmd /k "python server.py"
timeout /t 2 /nobreak >nul

REM Iniciar o viewer em nova janela
echo [2/3] Iniciando viewer...
start "Centipede Viewer" cmd /k "python viewer.py"
timeout /t 1 /nobreak >nul

REM Iniciar o agente (student) e aguardar terminar
echo [3/3] Iniciando agente...
echo.
python student.py

REM Quando student terminar, fechar as outras janelas
echo.
echo ========================================
echo   Agente terminou
echo   A mostrar highscores por alguns segundos...
echo ========================================

REM Dar tempo para o viewer renderizar a tabela de highscores antes de fechar.
REM Pode alterar o valor (segundos) aqui se precisar de mais tempo.
timeout /t 5 /nobreak >nul

REM Fechar janela do servidor
taskkill /FI "WindowTitle eq Centipede Server*" /F >nul 2>&1

REM Fechar janela do viewer
taskkill /FI "WindowTitle eq Centipede Viewer*" /F >nul 2>&1

echo.
echo Todos os processos foram encerrados.
echo.
pause
