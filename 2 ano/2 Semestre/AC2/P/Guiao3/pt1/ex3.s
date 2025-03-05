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
    .data
    .text
    .globl main

main:
    lui         $t1,ADDR_BASE_HI            # $t1=0xBF880000 
    lw          $t2,TRISD($t1)              # READ      (Mem_addr = 0xBF880000 + 0x6100) 
    ori         $t2,$t2,0x0100              # MODIFY    bit8 (1 means INPUT)
    sw          $t2,TRISD($t1)              # WRITE     Write TRISD register

    lw          $t3, TRISE($t1)             # READ      Mem_addr = 0xBF886040
    andi        $t3, $t3, 0xFFFE            # MODIFY    bit 0 (0 means OUTPUT)
    sw          $t3, TRISE($t1)             # WRITE     TRISE register

while:                                      # while(1)

    lw          $t2, PORTD($t1)             # Read from RD8
    andi        $t2, $t2, 0x0100            # Only keep bit8
    
    lw          $t3, LATE($t1)              # Read from LATE
    andi        $t3, $t3, 0xFFFE            # Reset bit0 to 0

    srl         $t2, $t2, 8                 # Shift bit8 to bit0
    nor          $t3, $t3, $t2               # Put bit8 from RD8 on RE0
    sw          $t3, LATE($t1)              # Store         

    j while

    jr $ra