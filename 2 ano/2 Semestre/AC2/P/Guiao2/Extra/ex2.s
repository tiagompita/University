    .equ READ_CORE_TIMER, 11 
    .equ RESET_CORE_TIMER, 12
    .equ K, 20000

    .data
    .text
    .globl main

main:
    addi    $sp, $sp, -20
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)
    sw      $s2, 12($sp)
    sw      $s3, 16($sp)

    li      $s0, 0                              # cnt1 = 0
    li      $s1, 0                              # cnt5 = 0
    li      $s2, 0                              # cnt10 = 0
    li      $s3, 0                              # tick = 0

while:

    li      $a0, 100                            #
    jal     delay                               # delay(100 ms)

    addi    $s3, $s3, 1                         # tick++

    addi    $s2, $s2, 1                         # Incrementa cnt10 a cada 10 Hz (100ms)

    rem     $t0, $s3, 2                         # Incrementa cnt5 a cada 200ms
    bne     $t0, 0, endif                       # if (tick % 2 == 0)
    addi    $s1, $s1, 1                         # cnt5++

endif:

    rem     $t0, $s3, 10                        # Incrementa cnt1 a cada 1000ms
    bne     $t0, 0, endif2                      # if (tick % 10 == 0)
    addi    $s0, $s0, 1                         # cnt1++
endif2:

    li      $a0, '\r'                           #
    li      $v0, 3                              #
    syscall                                     # putChar('\r')

    move    $a0, $s0                            #
    li      $t0, 5
    sll     $t0, $t0, 16                        
    ori     $a1, $t0, 10                        # 10 | 5 << 16
    li      $v0, 6                              #
    syscall                                     # printInt(cnt1, 10 | 5 << 16)

    li      $a0, '\t'                           #
    li      $v0, 3                              #
    syscall                                     # putChar('\t')

    move    $a0, $s1                            #
    li      $t0, 5
    sll     $t0, $t0, 16                        
    ori     $a1, $t0, 10                        # 10 | 5 << 16
    li      $v0, 6                              #
    syscall                                     # printInt(cnt5, 10 | 5 << 16)

    li      $a0, '\t'                           #
    li      $v0, 3                              #
    syscall                                     # putChar('\t')

    move    $a0, $s2                            #
    li      $t0, 5
    sll     $t0, $t0, 16                        
    ori     $a1, $t0, 10                        # 10 | 5 << 16
    li      $v0, 6                              #
    syscall                                     # printInt(cnt10, 10 | 5 << 16)

    li      $a0, '\t'                           #
    li      $v0, 3                              #
    syscall                                     # putChar('\t')

    j while

    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    lw      $s2, 12($sp)
    lw      $s3, 16($sp)
    addi    $sp, $sp, 20

    li      $v0, 0                              # return 0
    jr  $ra

#################################################

delay:

    li      $v0, RESET_CORE_TIMER               #
    syscall                                     #

while1:
    li      $v0, READ_CORE_TIMER                #
    syscall                                     #

    li      $t0, K
    mul     $t0, $t0, $a0
    blt     $v0, $t0, while1                     # while (readCoreTimer() < K * ms)

    jr $ra