	.data
str1: 	.asciiz "Introduza 2 numeros\n"
str2: 	.asciiz "A soma dos dois numeros e': "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	.text
	.globl main
	
main: 	la $a0, str1
	ori $v0, $0, print_string
	syscall 			# print_string(str1);
	
	ori $v0, $0, read_int
	syscall 			# valor lido e' retornado em $v0
	move $t0,$v0			# a => $t0 = read_int()
	
	ori $v0, $0, read_int
	syscall 			# valor lido e' retornado em $v0
	move $t1,$v0			# b => $t1 = read_int()
	
	la $a0, str2
	ori $v0, $0, print_string
	syscall 			# print_string(str2);
	
	add $t2, $t0, $t1		# a+b
	move $a0, $t2
	ori $v0, $0, print_int10
	syscall 			# print_int10(a+b);
	
	
	jr $ra 				# fim do programa