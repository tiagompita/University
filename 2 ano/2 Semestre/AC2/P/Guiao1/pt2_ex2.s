# Mapa de registos
#
#   c = $t0
#   cnt = $t1

    .data
    .text
    .globl main

main:   li      $t1, 0          # int cnt = 0;

do:     li      $v0, 1          # inkey()
        syscall
        move    $t0, $v0        # c = inkey()

if:     beq     $t0, $0, else
        li      $v0, 3          # putChar()
        move    $a0, $t0        # putChar(c)
        syscall
        j   endif
else:
        li      $v0, 3          #
        li      $a0, '.'        #
        syscall                 # putChar('.')
endif:

        addiu   $t1, $t1, 1     #cnt++

        li      $t2, '\n'
        bne     $t0, $t2, do    # while ( c != '\n' )

        li      $v0, 6
        move    $a0, $t1        #
        li      $a1, 10         #
        syscall                 # printInt(cnt, 10)

        li      $v0, 0          # return 0
        jr      $ra             # ---- Fim do Programa -------