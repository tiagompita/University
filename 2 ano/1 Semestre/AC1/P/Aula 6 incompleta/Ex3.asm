# Mapa de registos
# i: $t0
# j: $t1
# array[i][j]: $t3

	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	.data
array:	.word str1,str2,str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz	"Ponteiros"
out:	.asciiz "\nString #"
out2:	.asciiz ": "
	.text
	.globl main
	
main: 	li 	$t0, 0				# i = 0

for:	bge	$t0, SIZE, endfor		# for(i=0; i < SIZE; i++)

	li 	$v0, print_string		#
	la 	$a0, out			#
	syscall					# print_string( "\nString #" )
	
	li 	$v0, print_int10		#
	move	$a0, $t0			#
	syscall					# print_int10( i )
	
	li 	$v0, print_string		#
	la	$a0, out2			#
	syscall					# print_string( ": " )
	
	li 	$t1, 0				# j = 0
	
while:	la 	$t3, array 			# $t3 = &array[0]
	sll 	$t2, $t0,2 			# i * 4
	addu 	$t3, $t3,$t2 			# $t3 = &array[i]
	lw 	$t3, 0($t3) 			# $t3 = array[i] = &array[i][0]
	addu 	$t3, $t3, $t1 			# $t3 = &array[i][j]
	lb 	$t3, 0($t3) 			# $t3 = array[i][j]	

	beq	$t3, 0x00, endw			# while (array[i][j] != '\0')
	
	
	li	$v0, print_char			#
	move 	$a0, $t3			#
	syscall					# print_char(array[i][j])
	
	li	$v0, print_char			#
	li	$a0, '-'			#
	syscall					# print_char('-')

	addi	$t1, $t1, 1			# j++
	j while
endw:

	addi $t0, $t0, 1			# i++
	j for
endfor:
	
	jr $ra