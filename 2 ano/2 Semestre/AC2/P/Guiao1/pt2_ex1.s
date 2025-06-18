# Mapa de registos
#
#   c = $t0
#   cnt = $t1

    .data
    .text
    .globl main

main:   li      $t1, 0          # int cnt = 0;

do:     li      $v0, 2          # getChar()
        syscall
        move    $t0, $v0        # c = getChar()

        li      $v0, 3          # putChar()
        move    $a0, $t0        # putChar(c)
        addi    $a0, $a0, 1     # c + 1
        syscall

        addiu   $t1, $t1, 1     #cnt++

        li      $t2, '\n'
        bne     $t0, $t2, do    # while ( c != '\n' )

        li      $v0, 6
        move    $a0, $t1        #
        li      $a1, 10         #
        syscall                 # printInt(cnt, 10)

        li      $v0, 0          # return 0
        jr      $ra             # ---- Fim do Programa -------