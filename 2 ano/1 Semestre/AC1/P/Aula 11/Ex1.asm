	.data
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz	"\nNome: "
str3:	.asciiz	"\nNota: "
	.align 2	
stg:	.word 72343
	.asciiz "Napoleao"
	.space 9		#18 -(strlen("Napoleao" + 1 ) = 9
	.asciiz "Bonaparte"	
	.space 5		# 15 - (strlen("Bonaparte" + 1 ) = 5
	.float 5.1
	.text
	
	.globl main
	
main:	# o stg é iniciado multiplas vezes apenas para melhorar a visualizaçao do codigo, ou seja, nao é necessário tanta inicializaçao
	la	$a0, str1		#
	li 	$v0, 4			#
	syscall				# print_string("\nN. Mec: ");
	
	la	$t0, stg		#
	lw	$a0, 0($t0)		# $a0 = stg.id_number
	li	$v0, 36			#
	syscall				# print_int10(stg.id_number)
	
	la	$a0, str2		#
	li 	$v0, 4			#
	syscall				# print_string("\nNome: ");
	
	la	$t0, stg		#
	addiu	$a0, $t0, 22		#
	li 	$v0, 4			#
	syscall				# print_string(stg.last_name)
	
	li	$a0, ','		#
	li	$v0, 11			#
	syscall				# print_char(',')	
	
	la	$t0, stg		#
	addiu	$a0, $t0, 4		#
	li 	$v0, 4			#
	syscall				# print_string(stg.first_name)
	
	la	$a0, str3		#
	li 	$v0, 4			#
	syscall				# print_string("\nNota: ");
	
	la	$t0, stg		#
	l.s	$f12, 40($t0)		#
	li	$v0, 2			#
	syscall				# print_float(stg.grade);

	li	$v0, 0			#return 0
	jr $ra