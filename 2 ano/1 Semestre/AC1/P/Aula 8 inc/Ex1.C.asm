# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx

	.data
	.eqv print_int10, 1
str:	.asciiz "10001101"
	.text
	.globl main
	
main:	addiu 	$sp, $sp, -4	# Reservar um espaço na memoria para o $ra
	sw	$ra, 0($sp)	#
	
	la $a0, str		# $a0 = str
	jal atoi		# atoi(str)
	
	move $a0, $v0		# $a0 = atoi(str)
	li $v0, print_int10	#
	syscall			# print_int10(atoi(str))
	
	lw	$ra, 0($sp)	# Repoe o valor do registo $ra
	addiu	$sp, $sp, 4	#
	
	jr $ra			# fim do programa
				#
################################
				#
atoi:	li $v0, 0 		# res = 0;
while:	lb $t0, 0($a0) 		# while((*s >= '0') && (*s <= '1'))
	blt $t0, '0', endw 	# 
	bgt $t0, '1', endw	# {
	
	
	li $t2, '0'		# $t2 = '0'
	subu $t1, $t0, $t2	# digit = *s - '0';
	addi $a0, $a0, 1	# s++
	
	mulu  $v0, $v0, 2 	# res = 2 * res;
	addu  $v0, $v0, $t1  	# res = 2 * res + digit;
	j while 		# }
	
endw:	jr $ra 			# termina sub-rotina