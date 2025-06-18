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

	rem 	$t4, $t2,4			# i % 4
if:	bne 	$t4, $0, endif			# if ((i % 4) == 0)
	
	ori	$v0, $0, print_char		#
	li 	$a0, ' '			#
	syscall					# print_char(' ')
endif:	
	li 	$t3, 0x80000000			#
	and	$t1, $t0, $t3			# value & 0x80000000
	srl	$t1, $t1, 31			# bit = (value & 0x80000000) >> 31;
	
	ori	$v0, $0, print_char		#
	addi 	$a0, $t1, 0x30			#
	syscall					# print_char(0x30 + bit);
	
	sll 	$t0, $t0, 1			# shift left de 1 bit
	
	
	addi $t2, $t2, 1			# i++;
	j for
endfor:

	jr $ra					# fim do programa