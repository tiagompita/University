# Mapa de registos
# i: $t0
# lista: $t1
# lista + i: $t2
	.data
	.eqv SIZE, 5
str:	.asciiz	"\nIntroduza um numero: "
	.eqv print_string, 4
	.eqv read_int, 5
	.align 2			# 2^2 = 4
lista:	.space 20			# SIZE * 4
	.text
	.globl main
	
main: 	li 	$t0, 0 			# i = 0;

while: 	bge 	$t0, SIZE, endw 	# while(i < SIZE) {

	li	$v0, print_string	# 
	la	$a0, str		#
	syscall				# print_string("\nIntroduza um numero: ")
	
	li 	$v0, read_int		#
	syscall 			# $v0 = read_int()
	
	la 	$t1, lista 		# $t1 = lista (ou &lista[0])	// Carrega o endereço base do array 'lista' no registrador $t1.
	sll 	$t2, $t0,2 		# $t2 = i * 4			// Multiplica o valor de $t0 (índice i) por 4 (deslocamento lógico à esquerda por 2 bits) e armazena o resultado em $t2.
	addu 	$t2, $t1, $t2		# $t2 = &lista[i]		// Adiciona o valor de $t1 (endereço base de 'lista') ao valor de $t2 (deslocamento calculado), resultando no endereço do elemento 'lista[i]' e armazena em $t2.
	sw 	$v0, 0($t2) 		# lista[i] = read_int();	// Armazena o valor lido da entrada (armazenado em $v0) no endereço calculado (lista[i]).
	addi 	$t0, $t0, 1 		# i++
	
	j while				# }
	
endw: 	jr $ra # termina programa