# Mapa de registos
# $t0 = gray
# $t1 = num
# $t2 = bin	
	.data
	.text
	.globl main
	
main: 	li 	$t0, 100			#
	move 	$t1, $t0		# num = gray 
	move	$t4, $t1		# temp = num
					# 
	srl	$t3, $t4, 4		# temp >> 4
	xor	$t1, $t1, $t3		# num = num ^ (temp >> 4)
	
	srl	$t3, $t4, 2		# temp >> 2
	xor	$t1, $t1, $t3		# num = num ^ (temp >> 2)
	
	srl	$t3, $t4, 1		# temp >> 1
	xor	$t1, $t1, $t3		# num = num ^ (temp >> 1)
	
	move $t2, $t1
	
	jr 	$ra	# fim do programa
	