# i = $t0
#
	.eqv SIZE, 3
	.data
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
array:	.word str1,str2,str3		# Guarda o array de char
	.text
	.globl main

main:	
	li 	$t0, 0			# i = 0
for:	bge 	$t0,SIZE,endfor		# for ( i = 0; i < SIZE; i++)
	la 	$t1,array		# $t1 = &array[0]
	sll	$t2, $t0, 2		# $t2 = i * 4 (multiplica i por 4 para obter o offset)
	addu	$t2,$t2,$t1		# $t2 = &array[i]
	lw 	$a0,0($t2)		# $a0 = array[i]
	
	li 	$v0,4			#
	syscall				# print_string(array[i]
	
	li 	$a0,10			# Caractere '\n' (ASCII 10) em $a0
	li	$v0,11			#
	syscall				# print_char('\n')
	
	addi $t0,$t0,1			# i++
	j for
	
endfor:
	jr $ra