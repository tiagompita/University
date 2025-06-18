# Mapa de registos
# value: 	$t0
# bit: 		$t1
# i: 		$t2

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binário e': "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
	.text
	.globl main
	
main:	ori	$v0, $0, print_string		#
	la	$a0, str1			#
	syscall					# print_string("Introduza um numero: ")
	
	ori	$v0, $0, read_int		#
	syscall					# read_int()
	move 	$t0, $v0			# value = read_int()
	
	ori	$v0, $0, print_string		#
	la 	$a0, str2			#
	syscall					# print_string("\nO valor em binário e': ")
	
	li 	$t2, 0				# i = 0
for:	bge 	$t2, 32, endfor			# for ( i < 32 )
	li 	$t3, 0x80000000
	and 	$t1, $t0, $t3			# //isola bit 31
	
if: 	beq	$t1, 0, else			# if ( bit != 0 )

	ori	$v0, $0, print_char		#
	li	$a0, '1'			#
	syscall					# print_char('1')
	
	j endif
	
else:	ori	$v0, $0, print_char		#
	li 	$a0, '0'			#
	syscall					# print_char('0')
	
	j endif
endif: 	sll 	$t0, $t0, 1			# shift left de 1 bit
	
	
	addi $t2, $t2, 1			# i++;
	j for
endfor:

	jr $ra					# fim do programa