# Mapa de registos
#
# str:	$s0
# val: 	$s1
# O main é, neste caso, uma sub-rotina intermédia

	.data
	.eqv MAX_STR_SIZE, 33
	.eqv print_string, 4
	.eqv read_int, 5
str:	.space 33
	.text
	.globl main

main:	addiu	$sp, $sp, -12		# reserva espaço na stack, guarda reg. $ra, $s0, $s1 na stack
	sw	$ra, 0($sp)		#
	sw	$s0, 0($sp)		#
	sw	$s1, 0($sp)		#
	
do: 					# do {
	li 	$v0, read_int 		#
	syscall 			#
	move 	$s1,$v0 		# val = read_int()
############	
	move	$a0, $s1		#
	li	$a1, 2			#
	la	$a3, str		#
	jal	itoa			# itoa(val, 2, str)
	
	move	$a0, $v0		#
	li 	$v0, print_string	#
	syscall				# print_string ( itoa(val, 2, str) )
############
	move	$a0, $s1		#
	li	$a1, 8			#
	la	$a3, str		#
	jal	itoa			# itoa(val, 8, str)
	
	move	$a0, $v0		#
	li 	$v0, print_string	#
	syscall				# print_string ( itoa(val, 8, str) )
#############
	move	$a0, $s1		#
	li	$a1, 16			#
	la	$a3, str		#
	jal	itoa			# itoa(val, 16, str)
	
	move	$a0, $v0		#
	li 	$v0, print_string	#
	syscall				# print_string ( itoa(val, 16, str) )
	
	bne 	$s1, 0, do 		# } while(val != 0)
	
	li 	$v0, 0 			# return 0;





	lw	$ra, 0($sp)		# repoe os registos $ra, $s0, $s1. Liberta espaço na stack
	lw	$s0, 0($sp)		#
	lw	$s1, 0($sp)		#
	addiu	$sp, $sp, 12		#
	
	jr $ra				# fim do programa


# Mapa de registos
# 
# n:		$a0 -> $s0
# b:		$a1 -> $s1
# s:		$a2 -> $s2
# p:		$s3
# digit:	$t0

########################################

itoa:	addiu	$sp, $sp, -20 		# 5 variaveis * 4 bits ( n, b, s, p + $ra)
	sw	$ra, 0($sp)		#
	sw	$s0, 4($sp)		#
	sw	$s1, 8($sp)		#
	sw	$s2, 12($sp)		#
	sw	$s3, 16($sp)		# prologo
	
	move	$s0, $a0		# n
	move	$s1, $a1		# b
	move	$s2, $a2		# *s
	move	$s3, $a2		# char *p = s
	
	
do:					# do {
	rem	$t0, $s0, $s1		# digit = n % b;
	divu	$s0, $s0, $s1		# n = n / b;
	
	move 	$a0, $t0		#
	jal	toascii			# toascii( digit )
	sb	$v0, 0($s3)		# *p = toascii( digit )
	addiu	$s3, $s3, 1		# *p++;

	bgt	$s0, 0, do		# } while( n > 0 );
	
	sb	$0, 0($s3)		# *p = '\0';
	
	move 	$a0, $s0		# $a0 = s
	jal 	strrev			# strrev( s )
	
	move 	$v0, $s0		# return s
	
	lw	$ra, 0($sp)		# epilogo
	lw 	$s0, 4($sp)		#
	lw	$s1, 8($sp)		#
	lw	$s2, 12($sp)		#
	lw	$s3, 16($sp)		#
	addiu	$sp, $sp, 20		#
	
	jr $ra
	
########################################
# Converte o digito "v" para o respetivo código ASCII
#
# v = $a0

toascii:
	addi	$a0, $a0, '0'		# v += '0'
	
if:	ble	$a0, '9', endif		# if( v > '9' )
	addi	$a0, $a0, 7		# v += 7; // 'A' - '9' - 1
endif:	
	move 	$v0, $a0		# return v
	jr $ra
	