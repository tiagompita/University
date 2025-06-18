# O argumento da função é passado em $a0
# O resultado é devolvido em $v0
# Sub-rotina terminal: nÃ£o devem ser usados registos $sx

	.data
str:	.asciiz "Arquitetura de Computadores I"
	.eqv print_int10, 1
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4		# Salvaguarda do valor de $ra 
	sw	$ra, 0($sp)		# para que o programa possa terminar.
					
					
	la	$a0, str		# $a0 = str
	jal	strlen			# strlen(str)
	
	move 	$a0, $v0		# $a0 = strlen(str)
	li	$v0, print_int10	#
	syscall				# print_int10(strlen(str))
	
	lw	$ra, 0($sp)		# Repoem o valor de $ra
	addiu	$sp, $sp, 4		# Clear na Stack
	
	jr $ra				# exit program

#########################################

strlen: li $t1, 0 			# len = 0;
while: 	lb $t0, 0($a0) 			# while(*s++ != '\0')
	addiu $a0,$a0,1 		#
	
	beq $t0, '\0', endw 		# {
	addi $t1, $t1, 1		# len++;
	j while 			# }
	
endw: 	move $v0,$t1			# return len;
	jr $ra
