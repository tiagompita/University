    .equ K, 20000
    .equ READ_CORE_TIMER, 11 
    .equ RESET_CORE_TIMER, 12
    .data
    .text
    .globl main

main:

    jal configD11

while:

    li      $a0, 1              #
    jal     outD11              # outD11(1)
    li      $a0, 500            #
    jal     delay               # delay(500)

    li      $a0, 0              #
    jal     outD11              # outD11(0)
    li      $a0, 600            #
    jal     delay               # delay(600)

    li      $a0, 1              #
    jal     outD11              # outD11(1)
    li      $a0, 200            #
    jal     delay               # delay(200)

    li      $a0, 0              #
    jal     outD11              # outD11(0)
    li      $a0, 150            #
    jal     delay               # delay(150)

    li      $a0, 1              #
    jal     outD11              # outD11(1)
    li      $a0, 100            #
    jal     delay               # delay(100)

    li      $a0, 0              #
    jal     outD11              # outD11(0)
    li      $a0, 600            #
    jal     delay               # delay(600)

    j while

    jr $ra

####################

# void configD11(void) 
configD11: 
    lui     $t0,0xBF88 
    lw      $t1,0x6080($t0) 
    andi    $t1,$t1,0xBFFF 
    sw      $t1,0x6080($t0) 
    jr      $ra 

#####################

# void outD11(int val) 
outD11: 
    lui     $t0,0xBF88 
    lw      $t1,0x60A0($t0) 
    andi    $t1,$t1,0xBFFF 
    sll     $a0,$a0,14 
    or      $t1,$t1,$a0 
    sw      $t1,0x60A0($t0) 
    jr      $ra

########################

delay:

    li      $v0, RESET_CORE_TIMER               #
    syscall                                     #

while_delay:
    li      $v0, READ_CORE_TIMER                #
    syscall                                     #

    li      $t0, K
    mul     $t0, $t0, $a0
    blt     $v0, $t0, while_delay               # while (readCoreTimer() < K * ms)

    jr $ra