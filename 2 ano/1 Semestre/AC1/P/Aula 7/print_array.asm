# Mapa de registos
# a:		$t0
# *a:		$t2
# n:		$t1
# p:		$t3
# *p:		$t4
	.data
virg:	.asciiz ", "
	.text

print_array:
	move	$t0, $a0		# Salvaguardar a num registo temporario
	move	$t1, $a1		# Salvaguardar n num registo temporario

	sll	$t1, $t1, 2		# n * 4
	addu	$t3, $t1, $t0		# p = a + n
	
for_pa:	bge	$t0, $t3, endfor_pa	# for ( a < p )

	lw	$t2, 0($t0)		# *a
	
	move	$a0, $t2		# 
	li 	$v0, 1			#
	syscall				# print_int10( *a )
	
	la	$a0, virg		#
	li	$v0, 4			#
	syscall				# print_string(", ")
	
	addiu	$t0, $t0, 4		# a++
	j for_pa
endfor_pa:
	jr $ra				#