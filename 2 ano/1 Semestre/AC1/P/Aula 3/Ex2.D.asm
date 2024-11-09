# Mapa de registos
# value: 	$t0
# bit: 		$t1
# i: 		$t2
# flag:		$t3

	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binário e': "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11

	.text
	.globl main

main:
    	ori	$v0, $0, print_string	#
    	la  	$a0, str1		#
    	syscall                  	# print_string("Introduza um numero: ")

	ori 	$v0, $0, read_int	#
    	syscall                  	# read_int()
    	move 	$t0, $v0            	# value = read_int()

    	ori 	$v0, $0, print_string	#
    	la  	$a0, str2		#
    	syscall                 	# print_string("\nO valor em binário e': ")

    	li  	$t2, 0               	# i = 0
    	li  	$t3, 0               	# flag = 0

for:
    	bge 	$t2, 32, endfor      	# for (i < 32)

    					# 
    	li  	$t4, 0x80000000      	# 
    	and 	$t1, $t0, $t4        	# bit = value & 0x80000000
    	srl 	$t1, $t1, 31         	# bit = (value & 0x80000000) >> 31 (garante que bit é 0 ou 1)

    					# Condição if(flag == 1 || bit != 0)
    	bne 	$t3, $zero, print_bit 	# Se flag == 1, pula para print_bit
    	bne 	$t1, $zero, print_bit 	# Se bit != 0, pula para print_bit
    	j   skip_print            	# Ignora impressão se ambas as condições falharem

print_bit:
    	li  	$t3, 1               	# flag = 1 (para começar a imprimir os bits)

    					# Imprime um espaço a cada 4 bits
    	rem 	$t4, $t2, 4          	# Calcula i % 4
    	
    	bne 	$t4, $0, no_space	# if((i % 4) == 0)
    	ori 	$v0, $0, print_char	#
    	li  	$a0, ' '		#
    	syscall                  	# print_char(' ')

no_space:

    	addi 	$a0, $t1, 0x30      	# 0x30 + bit
    	ori  	$v0, $0, print_char	#
    	syscall				# print_char(0x30 + bit);

skip_print:

    	sll 	$t0, $t0, 1          	# value << 1
    	addi 	$t2, $t2, 1         	# i++
    	j for

endfor:
    	jr $ra                   	# fim do programa
