# Mapa de registos
# p: 		$t0
# ultimo:	$t1
# *p 		$t2
# soma: 	$t3

	.data
	.eqv SIZE, 4
	.eqv print_int10, 1
array:	.word 7692, 23, 5, 234
	.text
	.globl main
	
main:	li	$t3, 0			# soma = 0
	la	$t0, array		# p = array
	
	li	$t4, SIZE		# $t4 = SIZE
	addi	$t4, $t4, -1		# $t4 = $t4 - 1
	sll	$t4, $t4, 2		# $t4 = (SIZE-1) * 4 // cada inteiro ocupa 4 bytes
					#		     // por isso é preciso somar 4 a cada endereço
	
	addu	$t1, $t0, $t4		# ultimo = array + SIZE-1
	
while:	bgtu 	$t0, $t1, endw		# while(p <= pultimo)
	
	lw	$t2, 0($t0)		# *p
	add	$t3, $t3, $t2		#
	
	addiu	$t0, $t0, 4		# p++ 	// +4 pois são inteiros
	
	j while
endw:
	li	$v0, print_int10	#
	move	$a0, $t3		#
	syscall				# print_int10(soma)

	jr $ra			# fim do programa