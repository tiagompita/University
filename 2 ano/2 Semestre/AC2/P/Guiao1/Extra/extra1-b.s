# Mapa de registos
#
#   state = $s0
#   cnt =   $s1
#   c =     $s2
#   temp = $t0

    .equ UP, 1
    .equ DOWN, 0
    .equ STOP, 2
    
    .data
    .text
    .globl main

main:
    addi    $sp, $sp, -16
    sw      $s0, 0($sp)
    sw      $s1, 4($sp)
    sw      $s2, 8($sp)
    sw      $ra, 12($sp)

    li      $s0, STOP               # int state = STOP
    li      $s1, 0                  # int cnt = 0

do: li      $v0, 3                  #
    li      $a0, '\r'               #
    syscall                         # putChar('\r') // Carriage return character

    li      $v0, 6                  #
    move    $a0, $s1                #
    li      $t0, 3                  # temp = 3
    sll     $t0, $t0, 16            # temp = 3 << 16
    ori     $a1, $t0, 10            # 10 | 3 << 16
    syscall                         # printInt(cnt, 10 | 3 << 16) //0x0003000A: decimal w/ 3 digits

    li      $v0, 3                  #
    li      $a0, '\t'               #
    syscall                         # putChar('\t') // Tab character

    li      $v0, 6                  #
    move    $a0, $s1                #
    li      $t0, 8                  # temp = 8
    sll     $t0, $t0, 16            # temp = 8 << 16
    ori     $a1, $t0, 2             # 2 | 8 << 16
    syscall                         # printInt(cnt, 2 | 8 << 16) //0x00080002: decimal w/ 8 digits

    li      $a0, 5                  #
    jal     wait        

    li      $v0, 1                  #
    syscall                         # inkey()
    move    $s2, $v0                # c = inkey()

    bne     $s2, '+', elsif         # if (c == '+')
    li      $s0, UP                 # state = UP
    j endif 

elsif:      

    bne     $s2, '-', elsif2        # if (c == '-')
    li      $s0, DOWN               # state = DOWN
    j endif 
    
elsif2:

    bne     $s2, 's', elsif3        # if(c == 's')
    li      $s0, STOP               # state = STOP
    j endif 

elsif3:

    bne     $s2, 'r', else          # if (c == 'r')
    li      $s1, 0                  # cnt = 0
    j endif 
             
else:
    
    bne     $s0, UP, elsif4           # if (state == UP)
    addi    $s1, $s1, 1               # cnt = cnt + 1
    andi    $s1, $s1, 0xFF            # (cnt + 1) & 0xFF  //Up counter MOD 256
    j endif 
elsif4:

    bne     $s0, DOWN, endif          # if (state == DOWN)
    addi    $s1, $s1, -1              # cnt = cnt - 1
    andi    $s1, $s1, 0xFF            # (cnt + 1) & OxFF  //Down counter MOD 256

endif:       
          
    bne     $s2, 'q', do              # while (c != 'q')
          
    li      $v0, 0                    # return 0

    lw      $s0, 0($sp)
    lw      $s1, 4($sp)
    lw      $s2, 8($sp)
    lw      $ra, 12($sp)
    addi    $sp, $sp, 16
    
    jr      $ra

##############################

wait:
    li      $t0, 0           # i = 0
    li      $t1, 515000
    mul     $t1, $t1, $a0    # 515000 * ts
for:
    bge     $t0, $t1, endfor    # while ( i < 515000)

    addi    $t0, $t0, 1     # i++
    j for
endfor:
    jr  $ra                  

###############################