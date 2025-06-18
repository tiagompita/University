# Mapa de registos
# i:		$t0
# soma: 	$t1
# p:		$t2

	.data
	.eqv SIZE, 4
	.eqv print_int10, 1
array:	.word 7692, 23, 5, 234
	.text
	.globl main
	
main:	li	$t1, 0			# soma = 0
	li	$t0, 0			# i = 0
	
for:	bge	$t0, 4, endf		# for (int i = 0; i < SIZE; i++) {
	
	la	$t2, array		# p = array
	
	sll	$t5, $t0, 2		# i * 4
	
	addu	$t3, $t2, $t5		# array + i
	lw 	$t4, 0($t3)		# array[i]
	
	addu 	$t1, $t1, $t4		# soma += array[i]
	
	addi	$t0, $t0, 1		# i++
	j for
endf:
	li	$v0, print_int10	#
	move	$a0, $t1		#
	syscall				# print_int10(soma)

	jr $ra			# fim do programa