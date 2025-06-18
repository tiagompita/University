# Mapa de registos
# 	soma : 	$t0
# 	value: 	$t1
# 	i : 	$t2

	.data
str1:	.asciiz "Introduz um numero: "
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos e': "
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text
	.globl main

main: 	li	$t0, 0			# soma = 0
	li 	$t2, 0			# i = 0
	
for:	bge 	$t2, 5, endfor		# for ( i < 5 ) {
					
	ori 	$v0, $0, print_string	#
	la 	$a0, str1		#
	syscall				# print_string("Introduz um numero: ")
					
	ori	$v0, $0, read_int	#
	syscall				# read_int()
	move 	$t1, $v0		# value = read_int()
	
if:	blez 	$t1, else		# if (value > 0)
	add 	$t0, $t0, $t1		# soma = soma + value
	j endif
	
else:	ori	$v0, $0, print_string	#
	la	$a0, str2		#
	syscall				# print_string("Valor ignorado\n")
	
	j endif
endif:
	addi $t2, $t2, 1		# i++;
	j for
	
endfor: ori	$v0, $0, print_string	# }
	la	$a0, str3		#
	syscall				# print_string("A soma dos positivos e': ")
	
	ori	$v0, $0, print_int10	#
	move	$a0, $t0		#
	syscall				# print_int10(soma)
	
	jr $ra				# fim do programa