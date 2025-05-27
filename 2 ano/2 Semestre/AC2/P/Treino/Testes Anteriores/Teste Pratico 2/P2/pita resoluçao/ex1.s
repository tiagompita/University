    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ PORTE, 0x6110
    .equ LATE,  0x6120

    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ LATB,  0x6060

    .equ readCoreTimer, 11
    .equ resetCoreTimer, 12
    .data
    .text
    .globl main

main:

    lui     $t0, ADDR_BASE_HI

    lw      $t1, TRISE($t0)
    andi    $t1, $t1, 0xFFE0
    sw      $t1, TRISE($t0)
    
    lw      $t2, LATE($t0)      #
    andi    $t2, $t2, 0xFFE0    #
    sw      $t2, LATE($t0)

loop:
    li      $v0, 2
    syscall                     #getChar

    move    $t1, $v0

case0:
    bne     $t1, '0', case1
    ori     $t2, $t2, 0x0001
    sw      $t2, LATE($t0)
    j end
case1:
    bne     $t1, '1', case2
    ori     $t2, $t2, 0x0002
    sw      $t2, LATE($t0)
    j end 
case2:
    bne     $t1, '2', case3
    ori     $t2, $t2, 0x0004
    sw      $t2, LATE($t0)
    j end
case3:
    bne     $t1, '3', case4
    ori     $t2, $t2, 0x0008
    sw      $t2, LATE($t0)
    j end

case4:
    ori     $t2, $t2, 0x0010    #
    sw      $t2, LATE($t0)      #

    li      $a0, 2000           #
    move    $s0, $ra
    jal     delay
    move    $ra, $s0

    andi    $t2, $t2, 0xFFE0    #
    sw      $t2, LATE($t0)

end:

    j loop

delay:
    mul $t7, $a0, 20000
    li  $v0, resetCoreTimer
    syscall
wait:
    li  $v0, readCoreTimer
    syscall
    blt $v0, $t7, wait

    jr  $ra
