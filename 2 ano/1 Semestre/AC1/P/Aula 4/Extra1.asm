# Mapa de registos
# p:	$t0
# *p:	$t1

	.data
	.eqv SIZE, 20
	.eqv print_string, 4
	.eqv read_string, 8
str:	.space 21
str1:	.asciiz "Introduza uma string: "
	.text
	.globl main
	
main:	li	$v0, print_string		#
	la	$a0, str1			#
	syscall					# print_string("Introduza uma string: ")
	
	li	$v0, read_string		#
	la	$a0, str			#
	li	$a1, SIZE			#
	syscall					# read_string(str, SIZE)
	
	la	$t0, str			# p = &str[0]
	
while:	lb 	$t1, 0($t0)			# *p = str[i]
	beq 	$t1, 0x00, endw			# while (*p != '\0')
	
	blt	$t1, 'a', next			# if ( *p >= 'a' ) &&
	bgt 	$t1, 'z', next			#      ( *p <= 'z' )
	
	li 	$t2, 0x61			# 'a'
	li 	$t3, 0x41			# 'A'
	sub 	$t1, $t1, $t2			# *p = *p - 'a'
	add 	$t1, $t1, $t3			# *p = *p + 'A'
	sb 	$t1, 0($t0)			# store the converted character back
	
next:	addiu 	$t0, $t0, 1			# p++
	
	j while
endw:
	li	$v0, print_string		#
	la	$a0, str			#
	syscall					# print_string(str)
	
	jr $ra
