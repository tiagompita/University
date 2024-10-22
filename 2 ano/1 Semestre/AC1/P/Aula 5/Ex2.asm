# Mapa de registos
# 	p: $t0
#	*p: $t1 (Registo temporário para guardar o valor armazenado em memória)
# 	lista+Size: $t2
	.data
	.align 2
lista:	.word 8,-4, 3, 5, 124, -15, 87, 9, 27, 15 		# a diretiva ".word" alinha num endereço
								# múltiplo de 4
sep:	.asciiz "; "
str:	.asciiz "\nConteudo do array:\n"
	.text
	.globl main

main: 	la $a0,str		#
	li $v0,4		#
	syscall			# print_string(str)

	la $t0, lista 		# p = lista
	li $t3, 10		# $t3 = SIZE
	sll $t3, $t3, 2		# Coloca o SIZE em tamanho de inteiro => SIZE * 4
	addu $t2, $t0, $t3	# $t2 = lista + SIZE
	
while: 	bge $t0, $t2, endw	# while(p < lista+SIZE) {
	lw $t1, 0($t0)		# $t1 = *p 	Carrega o valor de p em $t1
	
	move $a0,$t1		#
	li $v0,1		#
	syscall			# print_int10( *p )
	
	la $a0,sep		#
	li $v0,4		#
	syscall			# print_string( sep )
	
	addi $t0, $t0, 4
		
	j while
endw:
	jr $ra