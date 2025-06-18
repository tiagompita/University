# Mapa de registos
#
#   value = $t0

    .data
msg1:   .asciiz "\nIntroduza um inteiro (sinal e módulo): "
msg2:   .asciiz "\nValor em base 10 (signed): "
msg3:   .asciiz "\nValor em base 2: "
msg4:   .asciiz "\nValor em base 16: "
msg5:   .asciiz "\nValor em base 10 (unsigned): "
msg6:   .asciiz "\nValor em base 10 (unsigned), formatado: "

    .text
    .globl main

main:
while:
    
    li      $v0, 8              #
    la      $a0, msg1           #
    syscall                     # printStr(msg1)

    li      $v0, 5              #
    syscall                     # readInt10()
    move    $t0, $v0            # value = readInt10()

    li      $v0, 8              #
    la      $a0, msg2           #
    syscall                     # printStr(msg2)

    li      $v0, 7              #
    move    $a0, $t0            #
    syscall                     # printInt10(value)

    li      $v0, 8              #
    la      $a0, msg3           #
    syscall                     # printStr(msg3)

    li      $v0, 6              #
    move    $a0, $t0            #
    li      $a1, 2              #
    syscall                     # printInt(value, 2)

    li      $v0, 8              #
    la      $a0, msg4           #
    syscall                     # printStr(msg4)

    li      $v0, 6              #
    move    $a0, $t0            #
    li      $a1, 16              #
    syscall                     # printInt(value, 16)

    li      $v0, 8              #
    la      $a0, msg5           #
    syscall                     # printStr(msg5)

    li      $v0, 6              #
    move    $a0, $t0            #
    li      $a1, 10              #
    syscall                     # printInt(value, 10)

    li      $v0, 8              #
    la      $a0, msg6           #
    syscall                     # printStr(msg6)

    li      $v0, 6              #
    move    $a0, $t0            #
    li      $t2, 5              # $temp = 5
    sll     $t2, $t2, 16        # 5 << 16
    ori     $a1, $t2, 10
    syscall                     # printInt(value, 10 | 5 << 16)

    j while

    li      $v0, 0              # return 0
    jr      $ra                 # ------ Fim do Programa ----------