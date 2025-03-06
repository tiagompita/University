    .equ READ_CORE_TIMER, 11 
    .equ RESET_CORE_TIMER, 12
    .equ K, 20000

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