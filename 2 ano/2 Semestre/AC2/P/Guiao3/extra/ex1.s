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
    lui     $t0, ADDR_BASE_HI           #
    
    lw      $t1, TRISE($t0)             # READ
    andi    $t1, $t1, 0xFFC3            # MODIFY 1111 1111 1100 0011 (0 means output)
    sw      $t1, TRISE($t0)             # WRITE

    lw      $t1, TRISB($t0)             # READ
    ori     $t1, $t1, 0x000F            # MODIFY (1 means input)
    sw      $t1, TRISB($t0)             # WRITE

loop:                                   # while(1)

    lw      $t1, PORTB($t0)             # READ   | RB0 to RB3
    andi    $t1, $t1, 0x000F            # MODIFY | Keep 4 LSB

    lw      $t2, LATE($t0)              # READ
    andi    $t2, $t2, 0xFFC3            # MODIFY | Reset 4 LSB

    xori    $t3, $t1, 0x0009            # Negar bit3 e bit0

    sll     $t3, $t3, 2                 # Colocar os bits na mesma posiçao que RE
    or      $t2, $t2, $t3               #
    sw      $t2, LATE($t0)              # WRITE

    j loop

    li      $v0, 0                      # return 0

    jr  $ra