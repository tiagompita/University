# Mapa de registos
#
#   counter : $t0

    .equ READ_CORE_TIMER, 11 
    .equ RESET_CORE_TIMER, 12
    .equ PUT_CHAR, 3
    .equ PRINT_INT, 6
    .data
    .text
    .globl main

main:
    li      $t0, 0                      # counter = 0

while:
    li      $a0, '\r'                   #
    li      $v0, PUT_CHAR               #
    syscall                             # putChar('\r')

    li      $t2, 4                      #
    sll     $t2, $t2, 16                # 4 << 16
    ori     $t1, $t2, 10                # 10 | 4 << 16

    move    $a0, $t0                    #
    move    $a1, $t1                    #
    li      $v0, PRINT_INT              #
    syscall                             # printInt(counter, 10 | 4 << 16)

    li      $v0, RESET_CORE_TIMER       #
    syscall                             # resetCoreTimer()

while2: 
    li      $v0, READ_CORE_TIMER        #
    syscall                             # readCoreTimer()
    blt     $v0, 4000000, while2         # while(readCoreTimer() < 4000000)

    addi    $t0, $t0, 1                 # counter++;
    j while

    li      $v0, 0                      # return 0

    jr $ra