# Mapa de registos
#
# str:	$s0
# val: 	$s1
# O main e', neste caso, uma sub-rotina interme'dia

	.data
	.eqv MAX_STR_SIZE, 33
	.eqv print_string, 4
	.eqv read_int, 5
nline:	.asciiz "\n"
str:	.space 33
	.text
	.globl main

main:	addiu	$sp, $sp, -12		# reserva espa�o na stack, guarda reg. $ra, $s0, $s1 na stack
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
	
	la	$a0, nline		#
	li	$v0, print_string	#
	syscall				# print_string("\n")
############
	move	$a0, $s1		#
	li	$a1, 8			#
	la	$a3, str		#
	jal	itoa			# itoa(val, 8, str)
	
	move	$a0, $v0		#
	li 	$v0, print_string	#
	syscall				# print_string ( itoa(val, 8, str) )
	
	la	$a0, nline		#
	li	$v0, print_string	#
	syscall				# print_string("\n")
#############
	move	$a0, $s1		#
	li	$a1, 16			#
	la	$a3, str		#
	jal	itoa			# itoa(val, 16, str)
	
	move	$a0, $v0		#
	li 	$v0, print_string	#
	syscall				# print_string ( itoa(val, 16, str) )
	
	la	$a0, nline		#
	li	$v0, print_string	#
	syscall				# print_string("\n")
	
	bne 	$s1, 0, do 		# } while(val != 0)
	
	li 	$v0, 0 			# return 0;





	lw	$ra, 0($sp)		# repoe os registos $ra, $s0, $s1. Liberta espa�o na stack
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
	move	$s2, $a2		# s
	move	$s3, $a2		# char *p = s
	
	
do1:					# do {
	rem	$t0, $s0, $s1		# digit = n % b;
	divu	$s0, $s0, $s1		# n = n / b;
	
	move 	$a0, $t0		# Passa digit para $a0
	jal	toascii			# toascii( digit )
	
	sb	$v0, 0($s3)		# *p = toascii( digit )
	addiu   $s3, $s3, 1        	# p++

	bgtz	$s0, do1		# } while( n > 0 );
	
	li	$t0, '\0'
	sb	$t0, 0($s3)		# *p = '\0';
	
	move 	$a0, $s2		# $a0 = s
	jal 	strrev			# strrev( s )
	
	move    $v0, $s2 		# return s ( $v0 já está com o retorno de strrev( s ) )
	
	lw	$ra, 0($sp)		# epilogo
	lw 	$s0, 4($sp)		#
	lw	$s1, 8($sp)		#
	lw	$s2, 12($sp)		#
	lw	$s3, 16($sp)		#
	addiu	$sp, $sp, 20		#
	
	jr $ra
	
#########################################
# Converte o digito "v" para o respetivo c�digo ASCII
#
# v = $a0

toascii:
	addi	$a0, $a0, '0'		# v += '0'
	
if:	ble	$a0, '9', endif		# if( v > '9' )
	addi	$a0, $a0, 7		# v += 7; // 'A' - '9' - 1
endif:	
	move 	$v0, $a0		# return v
	jr $ra
	
#########################################

# Mapa de registos:
# str: $a0 -> $s0 (argumento � passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
#

strrev: addiu 	$sp,$sp,-16 		# reserva espa�o na stack
	sw 	$ra,0($sp) 		# guarda endere�o de retorno
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
	lw 	$ra,0($sp) 		# rep�e endere�o de retorno
	lw 	$s0,4($sp) 		# rep�e o valor dos registos
	lw 	$s1,8($sp) 		# $s0, $s1 e $s2
	lw 	$s2,12($sp) 		#
	addiu 	$sp, $sp, 16 		# liberta espa�o da stack
	jr $ra 				# termina a sub-rotina
	
#########################################
# aux = $t0
exchange:
	lb 	$t0, 0($a0)		# aux = *c1
	lb	$t1, 0($a1)		# $t1 = *c1
	sb	$t1, 0($a0)		# *c1 = *c2
	sb	$t0, 0($a1)		# *c2 = aux
	
	jr $ra
