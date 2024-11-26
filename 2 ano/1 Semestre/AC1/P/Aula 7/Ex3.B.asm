	.data
STR_MAX_SIZE: .eqv STR_MAX_SIZE, 30
str1:   .asciiz "I serodatupmoC ed arutetiuqrA"
str2:   .space 31
msg_too_long: .asciiz "String too long: "
newline: .asciiz "\n"
    	.text
    	.globl main

main:   addiu   $sp, $sp, -8       # Salvaguarda do valor de $ra e $s0
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)

        la      $a0, str1          # $a0 = str1
        jal     strlen             # strlen(str1)
        move    $s0, $v0           # $s0 = strlen(str1)

        li      $t0, STR_MAX_SIZE  # Carregar STR_MAX_SIZE
        bgt     $s0, $t0, too_long # Se strlen(str1) > STR_MAX_SIZE, ir para too_long

        la      $a0, str2          # $a0 = str2
        la      $a1, str1          # $a1 = str1
        jal     strcpy             # strcpy(str2, str1)

        la      $a0, str2          # $a0 = str2
        li      $v0, 4             # syscall para print_string
        syscall

        la      $a0, newline       # $a0 = "\n"
        li      $v0, 4             # syscall para print_string
        syscall

        la      $a0, str2          # $a0 = str2
        jal     strrev             # strrev(str2)

        move    $a0, $v0           # $a0 = strrev(str2)
        li      $v0, 4             # syscall para print_string
        syscall

        li      $v0, 0             # exit_value = 0
        j       end_main

too_long:
        la      $a0, msg_too_long  # $a0 = "String too long: "
        li      $v0, 4             # syscall para print_string
        syscall

        move    $a0, $s0           # $a0 = strlen(str1)
        li      $v0, 1             # syscall para print_int10
        syscall

        li      $v0, -1            # exit_value = -1

end_main:
        lw      $ra, 0($sp)        # Repoem o valor de $ra
        lw      $s0, 4($sp)        # Repoem o valor de $s0
        addiu   $sp, $sp, 8        # Clear na Stack
        jr      $ra                # exit program
        
#########################################

strlen: li $t1, 0 			# len = 0;
while: 	lb $t0, 0($a0) 			# while(*s++ != '\0')
	addiu $a0,$a0,1 		#
	
	beq $t0, '\0', endw 		# {
	addi $t1, $t1, 1		# len++;
	j while 			# }
	
endw: 	move $v0,$t1			# return len;
	jr $ra

#########################################

# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
#

strrev: addiu 	$sp,$sp,-16 		# reserva espaço na stack
	sw 	$ra,0($sp) 		# guarda endereço de retorno
	sw 	$s0,4($sp) 		# guarda valor dos registos
	sw 	$s1,8($sp) 		# $s0, $s1 e $s2
	sw 	$s2,12($sp) 		#
	move 	$s0,$a0 		# registo "callee-saved"
	move 	$s1,$a0 		# p1 = str
	move 	$s2,$a0 		# p2 = str
	
while1: lb	$t0, 0($s2)		# $t0 = *p2
	beq 	$t0, '\0', endw1	# while( *p2 != '\0' ) {
	addiu 	$s2, $s2, 1 		# p2++;
	j while1 			# }
endw1:	addiu 	$s2, $s2, -1 		# p2--;
	
	
while2: bge 	$s1, $s2, endw2		# while(p1 < p2) {

	move 	$a0, $s1 		#
	move 	$a1, $s2 		#
	jal exchange 			# exchange(p1,p2)
	
	addiu 	$s1, $s1, 1 		# p1++;
	addiu 	$s2, $s2, -1 		# p2--;
	
	j while2 			# }
	
endw2:	move 	$v0,$s0 		# return str
	lw 	$ra,0($sp) 		# repõe endereço de retorno
	lw 	$s0,4($sp) 		# repõe o valor dos registos
	lw 	$s1,8($sp) 		# $s0, $s1 e $s2
	lw 	$s2,12($sp) 		#
	addiu 	$sp, $sp, 16 		# liberta espaço da stack
	jr $ra 				# termina a sub-rotina
	
#########################################
# aux = $t0
exchange:
	lb 	$t0, 0($a0)		# aux = *c1
	lb	$t1, 0($a1)		# $t1 = *c1
	sb	$t1, 0($a0)		# *c1 = *c2
	sb	$t0, 0($a1)		# *c2 = aux
	
	jr $ra

#########################################

# Mapa de Registos
# i:	$t0
# dst:	$t1	dst+i:	$t2	dst[i]:	$t3
# src:	$t4	src+i:	$t5	src[i]:	$t6
	

strcpy:
	li      $t0, 0          	# i = 0
	move    $t1, $a0        	# $t1 = dst
    	move    $t4, $a1        	# $t4 = src

do:					# do {
    	addu    $t2, $t1, $t0   	# dst+i
    	addu    $t5, $t4, $t0   	# src+i
    	
    	lb      $t6, 0($t5)     	# src[i]
    	sb      $t6, 0($t2)     	# dst[i] = src[i]
    	
    	addiu   $t0, $t0, 1     	# i++
    	
    	lb	$t6, 1($t5)		# 
    	bne     $t6, '\0', do	 	# } while( src[i++] != '\0' )

    	move    $v0, $a0        	# return dst
    	jr      $ra             	# exit

