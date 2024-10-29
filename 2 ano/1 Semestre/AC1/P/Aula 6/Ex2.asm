# p = $t1
# pultimo = $t2
	.eqv SIZE, 3
	.data
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
array:	.word str1,str2,str3		# Guarda o array de char
	.text
	.globl main

main:	la 	$t1,array 		# $t1 = p = &array[0] = array
	li 	$t0,SIZE 		# $t0 = SIZE
	sll 	$t0,$t0,2 		# $t0 = SIZE * 4 (multiplica SIZE por 4 para obter o offset)
	addu 	$t2,$t1,$t0 		# $t2 = pultimo = array + SIZE
	
for: 	bge 	$t1, $t2, endfor

	lw 	$a0,0($t1)		# Carrega o valor apontado por p em $a0 (endereço da string)
	li 	$v0, 4			#
	syscall				# print_string(*p)
	
	li 	$a0, 10			#
	li 	$v0, 11			#
	syscall				# print_string('\n')

	addi 	$t1,$t1,4		# p++
	j for

endfor:
	jr $ra