	.data
	.text
	.globl main
	
main: 	ori 	$t0, $0, 0x0F1E		# Valor do $t0
	
	nor 	$t1, $0, $t0		# not ( $t0 )
	
	jr 	$ra	# fim do programa
	