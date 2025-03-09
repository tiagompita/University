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
    lw          $t2,TRISB($t1)              # READ  (Mem_addr = 0xBF880000 + 0x6100) 
    ori         $t2,$t2,0x0001              # MODIFY (bit0 (1 means INPUT)) 
    sw          $t2,TRISB($t1)              # WRITE (Write TRISE register)

    lw          $t3, TRISE($t1)             # Mem_addr = 0xBF886040
    andi        $t3, $t3, 0xFFFE            # Modify bit 0 (0 means OUTPUT)
    sw          $t3, TRISE($t1)             # Write TRISB register

while:                                      # while(1)

    lw          $t2, PORTB($t1)             # Read from RB0
    andi        $t2, $t2, 0x0001            # Only keep bit0
    
    lw          $t3, LATE($t1)              # Read from LATE
    andi        $t3, $t3, 0xFFFE            # Reset bit0 to 0

    nor         $t4, $t3, $t2               # Put bit0 from RB0 negate on RE0
    sw          $t4, LATE($t1)              # Store         

    j while

    jr $ra