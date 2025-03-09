    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ LATB, 0x6060

    .equ TRISC, 0x6080
    .equ PORTC, 0x6090
    .equ LATC, 0x60A0

    .equ TRISD, 0x60C0
    .equ PORTD, 0x60D0
    .equ LATD, 0x60E0

    .equ TRISE, 0x6100
    .equ PORTE, 0x6110
    .equ LATE, 0x6120

    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12
    .equ K, 20000
    .data
    .text
    .globl main

main:
    addi    $sp, $sp, -8
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)

    li      $s0, 0                  #

    lui     $t1, ADDR_BASE_HI       #

    lw      $t2, TRISE($t1)         # READ
    andi    $t2, $t2, 0xFFFE        # MODIFY | RE0 as output
    sw      $t2, TRISE($t1)         # WRITE

    lw      $t2, TRISD($t1)         # READ
    andi    $t2, $t2, 0xFFFE        # MODIFY | RD0 as output
    sw      $t2, TRISD($t1)         # WRITE

loop:                               # while(1)

    lw      $t2, LATE($t1)          # READ
    andi    $t2, $t2, 0xFFFE        # MODIFY | Reset bit0
    
    lw      $t3, LATD($t1)          # READ
    andi    $t3, $t3, 0xFFFE        # MODIFY | Reset bit0

    or      $t2, $t2, $s0           #
    or      $t3, $t3, $s0
    sw      $t2, LATE($t1)          # WRITE
    sw      $t3, LATE($t1)          # WRITE

    li      $a0, 500                #
    jal     delay                   # delay(500)

    xori    $s0, $s0, 1             # v = v xor 1

    j loop

    li      $v0, 0

    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    addi    $sp, $sp, 8

    jr  $ra

    

delay:

    li      $v0, RESET_CORE_TIMER               #
    syscall                                     #

while:
    li      $v0, READ_CORE_TIMER                #
    syscall                                     #

    li      $t0, K
    mul     $t0, $t0, $a0
    blt     $v0, $t0, while                     # while (readCoreTimer() < K * ms)

    jr $ra