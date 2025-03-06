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
    .data
    .text
    .globl main

main:

    lui         $t0, ADDR_BASE_HI               # $t0 = 0xBF880000

    lw          $t1, TRISE($t0)                 # READ
    andi        $t1, $t1, 0xFFE1                # MODIFY 1111 1111 1110 0001
    sw          $t1, TRISE($t0)                 # WRITE

    li          $t2, 15                         # down counter (initial value 15)

loop:
    lw          $t1, LATE($t0)                  # READ
    andi        $t1, $t1, 0xFFE1                # Reset bits 4-1
    sll         $t3, $t2, 1                     # Shift counter value to "position" 1
    or          $t1, $t1, $t3                   # Merge counter w/ LATE value
    sw          $t1, LATE($t0)                  # Update LATE register 

    li          $v0, RESET_CORE_TIMER
    syscall
wait:
    li          $v0, READ_CORE_TIMER
    syscall
    blt         $v0, 5000000, wait              # e.g. f = 4Hz

    addi        $t2, $t2, -1
    andi        $t2, $t2, 0x000F                # e.g. down counter MOD 16

    j loop

    jr  $ra