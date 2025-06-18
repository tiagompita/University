# Mapa de registos
#
#   counter : $s0

    .equ READ_CORE_TIMER, 11 
    .equ RESET_CORE_TIMER, 12
    .equ PUT_CHAR, 3
    .equ PRINT_INT, 6
    .data
    .text
    .globl main

main:
    addi    $sp, $sp, -4                #
    sw      $ra, 0($sp)                 #

    li      $s0, 0                      # counter = 0

while:
    li      $a0, '\r'                   #
    li      $v0, PUT_CHAR               #
    syscall                             # putChar('\r')

    li      $t2, 4                      #
    sll     $t2, $t2, 16                # 4 << 16
    ori     $t1, $t2, 10                # 10 | 4 << 16

    move    $a0, $s0                    #
    move    $a1, $t1                    #
    li      $v0, PRINT_INT              #
    syscall                             # printInt(counter, 10 | 4 << 16)

    li      $a0, 1000                   #
    jal delay                           # delay(1s)

    addi    $s0, $s0, 1                 # counter++;
    j while

    li      $v0, 0                      # return 0

    lw      $ra, 0($sp)                 #
    addi    $sp, $sp, 4

    jr $ra

#########################################

    .equ K, 20000

delay:

    li      $v0, RESET_CORE_TIMER               #
    syscall                                     #

while3:
    li      $v0, READ_CORE_TIMER                #
    syscall                                     #

    li      $t0, K
    mul     $t0, $t0, $a0
    blt     $v0, $t0, while3                    # while (readCoreTimer() < K * ms)

    jr $ra