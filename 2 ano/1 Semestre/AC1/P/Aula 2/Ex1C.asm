	.data
	.text
	.globl main
main:	ori $t0,$0,0xE543	# 
	nor $t1,$0,$t0		# negaçao do valor_1
				#
	jr $ra 			# fim do programa