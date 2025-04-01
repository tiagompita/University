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

    lui     $t1, ADDR_BASE_HI       #
    lw      $t2, TRISB($t1)         # READ (Read TRISB register)  
    ori     $t2, $t2, 0x000F        # MODIFY (bit3 to bit0 = 1) 
    sw      $t2, TRISB($t1)         # WRITE (Write TRISB register)

    lw      $t2, TRISE($t1)         # READ
    andi    $t2, $t2, 0xFFF0        # MODIFY
    sw      $t2, TRISD($t1)         #

loop:                               # while(1)

    lw      $t2, PORTB($t1)         # READ
    andi    $t2, $t2, 0x000F        # MODIFY (only keep bit3-bit0)

    lw      $t3, LATE($t1)          # READ
    andi    $t3, $t3, 0xFFF0        # MODIFY (reset bit3-bit0 to 0)

    srl     $t4, $t2, 3             # Shift RB3 to 0
    sll     $t5, $t2, 3             # Shift RB0 to 3
    andi    $t4, $t4, 0x0001        # Only keep bit0
    andi    $t5, $t5, 0x0008        # Only keep bit3

    srl     $t6, $t2, 1             # Shift RB2 to 1
    sll     $t7, $t2, 1             # Shift RB1 to 2
    andi    $t6, $t6, 0x0002        # Only keep bit1
    andi    $t7, $t7, 0x0004        # Only keep bit2


    or      $t4, $t4, $t5           # merge bit0 and 3
    or      $t6, $t6, $t7           # merge bit1 and 2
    or      $t4, $t6, $t3           # merge all 4 bits

    or      $t3, $t3, $t4           # merge PORTB to LATE

    sw      $t3, LATE($t1)          # WRITE

    j loop

    li  $v0, 0                      # return 0

    jr  $ra                         # fim
