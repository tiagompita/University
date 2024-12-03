	.data
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz	"\nNome: "
str3:	.asciiz	"\nNota: "
str4:	.asciiz "\nPrimeiro nome: "
str5:	.asciiz "\nUltimo nome: "
	.align 2	
stg:	.space 44
	.text
	
	.globl main
	
main:	la	$t0, stg		#

	la	$a0, str1		#
	li	$v0, 4			#
	syscall				# print_string("\nN. Mec: ");
	
	li 	$v0, 5			#
	syscall				# read_int()
	
	sw	$v0, 0($t0)		# stg.id_number = read_int();
	
	la	$a0, str4		#
	li	$v0, 4			#
	syscall				# print_string("\nPrimeiro nome: ");
	
	addiu   $a0, $t0, 4         	# endereço do primeiro nome em `stg`
    	li      $a1, 17             	# tamanho máximo da string ( tem de ser um numero a menos pois o read_string adiciona o '\0' no fim da leitura)
    	li      $v0, 8             	# syscall para read_string
    	syscall                     	# read_string(stg.first_name, 17);
    	
    	la	$a0, str5		#
	li	$v0, 4			#
	syscall				# print_string("\nUltimo nome: ");
	
	addiu   $a0, $t0, 22         	# endereço do ultimo nome em `stg`
    	li      $a1, 14             	# tamanho máximo da string
    	li      $v0, 8             	# syscall para read_string
    	syscall                     	# read_string(stg.last_name, 14);
    	
    	la	$a0, str3		#
	li	$v0, 4			#
	syscall				# print_string("\nNota: ");
	
	li	$v0, 6			#
	syscall				# read_float()
	
	s.s	$f0, 40($t0)		# stg.grade = read_float()

#########################################
	la	$a0, str1		#
	li 	$v0, 4			#
	syscall				# print_string("\nN. Mec: ");
	
	
	lw	$a0, 0($t0)		# $a0 = stg.id_number
	li	$v0, 36			#
	syscall				# print_int10(stg.id_number)
	
	la	$a0, str2		#
	li 	$v0, 4			#
	syscall				# print_string("\nNome: ");
	
	addiu	$a0, $t0, 22		#
	li 	$v0, 4			#
	syscall				# print_string(stg.last_name)
	
	li	$a0, ','		#
	li	$v0, 11			#
	syscall				# print_char(',')	
	
	addiu	$a0, $t0, 4		#
	li 	$v0, 4			#
	syscall				# print_string(stg.first_name)
	
	la	$a0, str3		#
	li 	$v0, 4			#
	syscall				# print_string("\nNota: ");
	
	l.s	$f12, 40($t0)		#
	li	$v0, 2			#
	syscall				# print_float(stg.grade);

	li	$v0, 0			#return 0
	jr $ra