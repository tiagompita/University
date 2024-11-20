# Mapa de registos
# lista:	$t2
# i:		$t3
# houve_troca: 	$t4
# p: 		$t5
# ultimoOrdenado: 	$t6
# *p: 		$t7
# *ultimo: 	$t8
	
	.data
	.eqv SIZE, 10
	.eqv FALSE, 0
	.eqv TRUE, 1
	.eqv LAST_OFFSET, 36  # Precalcula deslocamento do último elemento

lista: 	.space 40  				# SIZE * 4
str: 	.asciiz "\nIntroduza 10 numeros:\n"
str1: 	.asciiz "; "
str2: 	.asciiz "\nConteudo do array ordenado:\n"
	.text
	.globl main

main:
    	# Leitura de valores e preenchimento do array usando acesso por ponteiro
    	li 	$v0, 4
    	la 	$a0, str
    	syscall

    	la 	$t2, lista  			# $t2 = lista
    	li 	$t3, 0      			# i = 0

read_loop:
    	bge 	$t3, SIZE, sort_array  		# if (i >= SIZE) break;
    
    	li 	$v0, 5
    	syscall
    	sw 	$v0, 0($t2) 			# *lista = read_int();
    
    	addiu 	$t2, $t2, 4  			# lista[i] + 1
    	addiu 	$t3, $t3, 1  			# i++
    	j read_loop

sort_array:
    	# Inicializa ponteiros e variáveis
    	la 	$t6, lista  			# ultimo = lista
    	addiu 	$t6, $t6, LAST_OFFSET  		# ultimoOrdenado = lista + (SIZE - 1)
    	
do:
    	li 	$t4, FALSE  			# houve_troca = FALSE
    	move	$t8, $t6			# pUltimo = ultimoOrdenado
    	la	$t5, lista			# p = lista

for_loop:
    	bge 	$t5, $t8, end_for  		# while (p < pUltimo)
    
    	lw 	$t7, 0($t5)         		# t7 = *p
    	lw 	$t9, 4($t5)         		# t9 = *(p+1)
    
    	bleu 	$t7, $t9, end_if   		# if (*p > *(p+1)) 
    
    	sw 	$t9, 0($t5)         		# *p = *(p+1)
    	sw 	$t7, 4($t5)         		# *(p+1) = *p
    	li 	$t4, TRUE           		# houve_troca = TRUE
    	move	$t6, $t5			# ultimoOrdenado = p

end_if:
    	addiu 	$t5, $t5, 4      		# p++
    	j for_loop

end_for:
    	bne 	$t4, FALSE, do     		# } while (houve_troca == TRUE)

print_array:
    	# Impressão do conteúdo do array usando acesso indexado
    	li 	$v0, 4
    	la 	$a0, str2
    	syscall

    	li 	$t3, 0  			# i = 0
print_loop:
    	bge 	$t3, SIZE, end_print  	# if (i >= SIZE) break;

    	sll 	$t7, $t3, 2
    	la 	$t6, lista
    	addu 	$t7, $t6, $t7  			# $t7 = &lista[i]
    
    	lw 	$t8, 0($t7)  			# $t8 = lista[i]
    
    	li 	$v0, 1
    	move 	$a0, $t8
    	syscall  				# print_int10(lista[i])
    
    	li 	$v0, 4
    	la 	$a0, str1
    	syscall  				# print_string("; ")
    
    	addiu 	$t3, $t3, 1  			# i++
    	j print_loop

end_print:
    	jr $ra  # termina o programa
