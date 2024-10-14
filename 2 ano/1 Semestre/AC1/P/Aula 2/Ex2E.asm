	.data
	.text
	.globl main

#Mapa de registos
#	gray = $t0
#	num = $t1
#	bin = $t2

main:	li $t0,7		# gray = 2
	
	or $t1,$0,$t0		# num = gray
	srl $t3,$t1,4		# num >> 4 em $t3
	xor $t1,$t1,$t3		# num = num ^ (num >> 4);
	
	srl $t3,$t1,2		# num >> 2 em $t3
	xor $t1,$t1,$t3		# num = num ^ (num >> 2);
	
	srl $t3,$t1,1		# num >> 1 em $t3
	xor $t1,$t1,$t3		# num = num ^ (num >> 1);
	
	or $t2,$0,$t1		# bin = num
	
	
	jr $ra
	