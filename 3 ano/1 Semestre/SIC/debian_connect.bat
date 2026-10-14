@echo off
title Debian SSH

echo A ligar ao Debian...

ssh -t pita@192.168.137.128 "sudo vmhgfs-fuse .host:/SIC /home/pita/Desktop/sic/ -o allow_other -o uid=1000 && cd /home/pita/Desktop/sic/P && exec bash -l"