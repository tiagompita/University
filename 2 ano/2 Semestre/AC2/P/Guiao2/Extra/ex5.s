    .equ READ_CORE_TIMER, 11 
    .equ RESET_CORE_TIMER, 12
    .equ K, 20000

timeDone:

    li      $t1, 0                  # retValue = 0

if: ble     $a1, 0, else            #
    li      $v0, RESET_CORE_TIMER   #
    syscall                         # resetCoreTimer()

    j       endif
else:
    li      $v0, READ_CORE_TIMER    #
    syscall                         # readCoreTimer()
    move    $t0, $v0                # curCount = readCoreTimer()
endif:

if2:
    li      $t3, K                  #
    mul     $t4, $t3, $a0           # K * ms
    ble     $t0, $t4, endif2        # if (curCount > (K * ms))
    div     $t1, $t0, $t3           # retValue = curCount / K;
endif2:
    move    $v0, $t1                # return retValue

    jr      $ra