    .data
    .equ ADDR_BASE_HI,0xBF88    # Base address: 16 MSbits 
    .equ TRISE,0x6100           # TRISE address is 0xBF886100 
    .equ PORTE,0x6110           # PORTE address is 0xBF886110 
    .equ LATE,0x6120            # LATE  address is 0xBF886120

    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ LATB, 0x6060

    .equ TRISC, 0x6080
    .equ PORTC, 0x6090
    .equ LATC, 0x60A0

    .equ TRISD, 0x60C0
    .equ PORTD, 0x60D0
    .equ LATD, 0x60E0

    .equ readCoreTimer, 11
    .equ resetCoreTimer, 12
    .text
    .globl main

main:

    lui     $t0, ADDR_BASE_HI       
    lw      $t1, TRISE($t0)         # READ
    andi    $t1, $t1, 0xFFF0        # MODIFY
    sw      $t1, TRISE($t0)         # WRITE

    andi    $t1, $t1, 0x0000        # Start with all LEDs off
    sw      $t1, LATE($t0)

loop:                               # while(1)

    li      $v0, 2                  # getChar()
    syscall

case1:
    bne     $v0, 48, case2
    andi	$t1, $t1, 0xFFF0
    ori     $t1, $t1, 0x0001        # Set bit0 = 1
    sw      $t1, LATE($t0)          # WRITE
    j endif

case2:
    bne     $v0, 49, case3
    andi	$t1, $t1, 0xFFF0
    ori     $t1, $t1, 0x0002        # Set bit0 = 1
    sw      $t1, LATE($t0)          # WRITE
    j endif

case3:
    bne     $v0, 50, case4
    andi	$t1, $t1, 0xFFF0
    ori     $t1, $t1, 0x0004        # Set bit0 = 1
    sw      $t1, LATE($t0)          # WRITE
    j endif

case4:
    bne     $v0, 51, case5
    andi	$t1, $t1, 0xFFF0
    ori     $t1, $t1, 0x0008        # Set bit0 = 1
    sw      $t1, LATE($t0)          # WRITE
    j endif

case5:
    andi	$t1, $t1, 0xFFF0
    ori     $t1, $t1, 0x000F        # Set 4 LSB = 1

    sw      $t1, LATE($t0)          # WRITE

    li      $v0, resetCoreTimer
    syscall
wait:
    li      $v0, readCoreTimer
    syscall
    blt     $v0, 20000000, wait     # f = 1Hz

    andi    $t1, $t1, 0x0000        # turn off all LEDs
    sw      $t1, LATE($t0)

endif:

    j loop

    li  $v0, 0                      # return 0

    jr  $ra                         # fim
