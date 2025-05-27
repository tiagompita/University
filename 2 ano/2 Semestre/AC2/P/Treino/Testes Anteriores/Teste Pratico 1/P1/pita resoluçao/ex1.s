    .equ ADDR_BASE_HI,0xBF88

    .equ TRISE, 0x6100     
    .equ PORTE, 0x6110    
    .equ LATE,  0x6120 

    .equ TRISB, 0x6040
    .equ PORTB, 0x6050
    .equ LATB,  0x6060

    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11

    .data
    .text
    .globl main

main:
    lui     $t0, ADDR_BASE_HI       # Load base address

    lw      $t1, TRISB($t0)         # READ TRISB
    ori     $t1, $t1, 0x000F        # Set RB3-RB0 as inputs
    sw      $t1, TRISB($t0)         # WRITE TRISB

    lw      $t1, TRISE($t0)         # READ TRISE
    andi    $t1, $t1, 0xFF7F        # Set RE7 as output
    sw      $t1, TRISE($t0)         # WRITE TRISE

    lw      $t2, LATE($t0)          # READ LATE
    ori     $t2, $t2, 0x0080        # Set bit7 to 1
    sw      $t2, LATE($t0)          # WRITE LATE

loop:
    lw      $t1, PORTB($t0)         # READ PORTB
    andi    $t1, $t1, 0x000F        # Only keep bits 3-0

    li      $v0, 6                  
    move    $a0, $t1                # Pass PORTB value (bits 3-0)
    li      $a1, 16                 
    syscall                         # Print value

    lw      $t2, LATE($t0)          # READ LATE
    xori    $t2, $t2, 0x0080        # Toggle bit7
    sw      $t2, LATE($t0)          # WRITE LATE

    li      $a0, 2                  # 2ms delay
    jal     delay                   

    j loop                          

delay:
    mul     $t7, $a0, 40000         
    li      $v0, resetCoreTimer     
    syscall
wait:
    li      $v0, readCoreTimer      
    syscall
    blt     $v0, $t7, wait          

    jr      $ra
