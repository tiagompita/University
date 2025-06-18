	.data
	.text
	.globl main

#Mapa de registos
#	bin = $t0
#	gray = $t1

main:	li $t0,5		# bin = 2
	
	srl $t2,$t0,1		# bin >> 1 em $t2
	xor $t1,$t2,$t0		# gray = bin ^ (bin >> 1)
	
	jr $ra
	