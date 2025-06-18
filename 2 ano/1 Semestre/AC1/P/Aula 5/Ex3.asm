# Mapa de registos
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7
# lista[i]: $t8
# lista[i+1]: $t9

	.data
	.eqv SIZE, 10
	.eqv FALSE, 0
	.eqv TRUE, 1
lista: 	.space 40  # SIZE * 4
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

    	la 	$t6, lista  			# p = lista
    	li 	$t5, 0      			# i = 0

read_loop:
    	bge 	$t5, SIZE, sort_array  		# if (i >= SIZE) break;
    
    	li 	$v0, 5
    	syscall
    	sw 	$v0, 0($t6) 			# *p = read_int();
    
    	addiu 	$t6, $t6, 4  			# p++
    	addiu 	$t5, $t5, 1  			# i++
    	j read_loop

sort_array:
    	li 	$t1, SIZE  			# t1 = tamanho do array
    	addiu 	$t1, $t1, -1  			# t1 = SIZE - 1 (número de comparações da 1ª iteração)

do:
    	li 	$t4, FALSE  			# houve_troca = FALSE
    	li 	$t5, 0      			# i = 0

for_loop:
    	bge 	$t5, $t1, end_for  		# while (i < SIZE - 1 - k)

    	sll 	$t7, $t5, 2        		# t7 = i * 4
    	la 	$t6, lista          		# carrega endereço base de lista
    	addu 	$t7, $t6, $t7     		# t7 = &lista[i]
    
    	lw 	$t8, 0($t7)         		# t8 = lista[i]
    	lw 	$t9, 4($t7)         		# t9 = lista[i+1]
    
    	ble 	$t8, $t9, end_if   		# if (lista[i] > lista[i+1]) 
    
    	sw 	$t8, 4($t7)         		# lista[i+1] = lista[i]
    	sw 	$t9, 0($t7)         		# lista[i] = lista[i+1]
    	li 	$t4, TRUE           		# houve_troca = TRUE

end_if:
    	addiu 	$t5, $t5, 1      		# i++
    	j for_loop

end_for:
    	bne 	$t4, FALSE, do     		# } while (houve_troca == TRUE)
    	addiu 	$t1, $t1, -1     		# Reduz limite superior (t1--)
    	bgtz 	$t1, do           		# Continua até t1 > 0


print_array:
    	# Impressão do conteúdo do array usando acesso indexado
    	li 	$v0, 4
    	la 	$a0, str2
    	syscall

    	li 	$t5, 0  			# i = 0
print_loop:
    	bge 	$t5, SIZE, end_print  		# if (i >= SIZE) break;

    	sll 	$t7, $t5, 2
    	la 	$t6, lista
    	addu 	$t7, $t6, $t7  			# $t7 = &lista[i]
    
    	lw 	$t8, 0($t7)  			# $t8 = lista[i]
    
    	li 	$v0, 1
    	move 	$a0, $t8
    	syscall  				# print_int10(lista[i])
    
    	li 	$v0, 4
    	la 	$a0, str1
    	syscall  				# print_string("; ")
    
    	addiu 	$t5, $t5, 1  			# i++
    	j print_loop

end_print:
    	jr $ra  # termina o programa