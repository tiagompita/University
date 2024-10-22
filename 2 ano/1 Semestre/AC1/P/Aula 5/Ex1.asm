# i: 		$t0
# lista: 	$t1
# lista + i: 	$t2
	.data
	.eqv SIZE,5		#Define SIZE 5
	.align 2
lista:	.space 20		# (4 * 5) = 20	static int lista[SIZE]
str: 	.asciiz "\nIntroduza um numero: "
	.text
	.globl main

main:	li $t0,0		# i = 0
while:	bge $t0,SIZE,endw	# while (i < SIZE) {
				#
	la $a0,str		#
	li $v0,4		#
	syscall			# print_string(str)
				#
	li $v0,5		#
	syscall			# $v0 = read_int()
				#
	la $t1,lista		# $t1 = lista
	sll $t2,$t0,2		# Calcular corretamente o valor do endereço
	addu $t2,$t1,$t2	# $t2 = &lista[i]
	sw  $v0,0($t2)		# lista[i] = read_int()
	
	addi $t0,$t0,1		# i++
	
	j while
endw:
	jr $ra