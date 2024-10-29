# i = $t0
# j = $t1
	.eqv SIZE, 3
	.data
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
nString: .asciiz "\nString #"
ddot:	.asciiz ": "
array:	.word str1,str2,str3		# Guarda o array de char
	.text
	.globl main

main:	li 	$t0, 0			# i = 0
for: 	bge 	$t0, SIZE, endfor	# while ( i < SIZE ) {

	la 	$a0,nString		#
	li 	$v0, 4			#
	syscall				# print_string( "\nString #" )
	
	move 	$a0,$t0			#
	li	$v0, 1			#
	syscall				# print_int10( i )
	
	la 	$a0, ddot		#
	li 	$v0, 4			#
	syscall				# print_string( ": "

	li 	$t1, 0			# j = 0

while:					# while( array[i][j] != '\0') {
	la 	$t2,array		# $t2 = array ( $t2 = &array[0] )
	sll 	$t3, $t0, 2		# $t3 = i * 4 (multiplica i por 4 para obter o offset)
	addu 	$t2, $t2, $t3		# $t2 = &array[i]
	
	lw 	$t2,0($t2)		# $t2 = array[i] = &array[i][0]
	addu 	$t2, $t2, $t1		# $t2 = &array[i][j]
	lb	$t2, 0($t2)		# $t2 = array[i][j]
	
	beq	$t2, '\0', endwhile
	
	move 	$a0,$t2			#
	li 	$v0, 11			#
	syscall				# print_char( array[i][j] ) 
	
	li 	$v0, 11			#
	li 	$a0, '-'			#
	syscall				# print_char('-')
	
	addi 	$t1, $t1,1		# j++
	j 	while 			# }
	
endwhile:

	addi 	$t0,$t0,1		# i++
	j 	for			# }

endfor:
	jr $ra