@echo off
title Debian SSH

:connect
echo A ligar ao Debian...

echo A montar a pasta partilhada...
ssh -t pita@192.168.213.131 "sudo vmhgfs-fuse .host:/SIC /home/pita/Desktop/sic/ -o allow_other -o uid=1000"

echo A abrir a sessao SSH...
ssh pita@192.168.213.131

echo.
echo A ligacao foi terminada. Nova tentativa em 5 segundos...
timeout /t 5 /nobreak >nul
goto connect