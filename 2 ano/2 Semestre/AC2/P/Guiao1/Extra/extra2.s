#Mapa de registos
#
#
#

    .equ SIZE, 20
    .data
str1: .space 21
str2: .space 21
str3: .space 41

msg1: .asciiz "Introduza 2 strings: "
msg2: .asciiz "Resultados:\n"
newline: .asciiz "\n"

    .text
    .globl main

main:
    addi    $sp, $sp, -4
    sw      $ra, 0($sp)

    li      $v0, 8              #
    la      $a0, msg1           #
    syscall                     # printStr("Introduza 2 strings: ");

    li      $v0, 9              #
    la      $a0, str1           #
    li      $a1, SIZE           #
    syscall                     # readStr( str1, SIZE )

    li      $v0, 9              #
    la      $a0, str2           #
    li      $a1, SIZE           #
    syscall                     # readStr( str2, SIZE )

    li      $v0, 8              #
    la      $a0, msg2           #
    syscall                     # printStr("Resultados:\n");

    la      $a0, str1           #
    jal     strlen              # strlen(str1)

    move    $a0, $v0            #
    li      $v0, 6              #
    li      $a1, 10             #
    syscall                     # printInt( strlen(str1), 10 )

    li      $v0, 8              #
    la      $a0, newline        #
    syscall                     # printStr("\n");

    la      $a0, str2           #
    jal     strlen              # strlen(str2)

    move    $a0, $v0            #
    li      $v0, 6              #
    li      $a1, 10             #
    syscall                     # printInt( strlen(str2), 10 )

    li      $v0, 8              #
    la      $a0, newline        #
    syscall                     # printStr("\n");

    la      $a0, str3           #
    la      $a1, str1           #
    jal     strcpy              # strcpy(str3, str1)

    la      $a0, str3           #
    la      $a1, str2           #
    jal     strcat              # strcat(str3, str2)

    move    $a0, $v0            #
    li      $v0, 8              #
    syscall                     # printStr( strcat(str3, str2) )

    li      $v0, 8              #
    la      $a0, newline        #
    syscall                     # printStr("\n");

    la      $a0, str1           #
    la      $a1, str2           #
    jal strcmp                  # strcmp(str1, str2)

    move    $a0, $v0            #
    li      $v0, 7
    syscall                     # printInt10(strcmp(str1, str2))

    lw      $ra, 0($sp)
    addi    $sp, $sp, 4

    li      $v0, 0              # return 0

    jr $ra

##################################
# Returns the length of string "str" (excluding the null character)
#
#   len : $t0
strlen:
    li      $t0, 0              # len = 0
len_loop:
    lb      $t1, 0($a0)         # *str
    beq     $t1, 0, len_end     # while (*str != '\0')

    addi    $a0, $a0, 1         # str++
    addi    $t0, $t0, 1         # len++

    j len_loop

len_end:
    move    $v0, $t0
    jr      $ra

####################################
# Copy the string pointed by "src" (including the null character) to destination (pointed by "dst)
#
#   p = $t0

strcpy:

    move    $t0, $a0            # *p = dst
copy_loop:
    lb      $t1, 0($a1)         # $t1 = *src
    sb      $t1, 0($a0)         # *dst = $t1
    beq     $t1, 0, copy_end    # *dst != '\0'

    addi    $a0, $a0, 1         # dst++
    addi    $a1, $a1, 1         # src++

    j copy_loop

copy_end:
    move    $v0, $t0            # return p
    jr      $ra

#####################################    
# Concatenates "dst" and "src" string
# The result is stored in the "dst" string
#
#   $s0 = p
#   $s1 = $a0 (dst)
#   $s2 = $a1 (src)

strcat:
    addi    $sp, $sp, -16
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)
    sw      $s2, 12($sp)

    move    $s1, $a0
    move    $s2, $a1
    move    $s0, $s1

cat_loop:
    lb      $t0, 0($s1)             # *dst
    beq     $t0, 0, cat_end         # *dst != '\0'

    addi    $s1, $s1, 1             # dst++
    j cat_loop
cat_end:
    move    $a0, $s1                #
    move    $a1, $s2                #
    jal strcpy                      # strcpy( dst, src)

    move    $v0, $s0                # return p

    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    lw      $s2, 12($sp)
    addi    $sp, $sp, 16
    jr $ra

######################################
# Compares two strings, character by character 
# Returned value is: 
#  < 0   string "str1" is "less than" string "str2" (first  
#    non-matching character in str1 is lower, in ASCII, than  
#    that of str2) 
#  = 0  string "str1" is equal to string "str2" 
#  > 0  string "str1" is "greater than" string "str2" (first  
#    non-matching character in str1 is greater, in ASCII, than  
#    that of str2)

strcmp:
cmp_copy:
    lb      $t0, 0($a0)             # *str1
    lb      $t1, 0($a1)             # *str2
    bne     $t0, $t1, cmp_end       # if (*str1 != *str2) break
    beq     $t0, 0, cmp_end         # if (*str1 = '\0') break

    addi    $a0, $a0, 1             # str1++
    addi    $a1, $a1, 1             # str2++
    j cmp_copy
cmp_end:
    sub     $v0, $t0, $t1
    jr  $ra