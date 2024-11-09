# Mapa de registos
# res = $t0
# i = $t1
# mdor = $t2
# mdo = $t3

	.data
str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	.text
	.globl main
	
main: 	li	$t0, 0 			# res = 0
	li 	$t1, 0			# i = 0
	
	ori	$v0, $0, print_string	#
	la 	$a0, str1		#
	syscall				# print_string("Introduza dois numeros: ")
	
	ori 	$v0, $0, read_int	#
	syscall				# read_int()
	andi	$t4, $v0, 0x0F		# read_int() & 0x0F
	move 	$t2, $t4		# mdor = read_int() & 0x0F
	
	ori 	$v0, $0, read_int	#
	syscall				# read_int()
	andi	$t4, $v0, 0x0F		# read_int() & 0x0F
	move 	$t3, $t4		# mdo = read_int() & 0x0F
	
while: 	beq	$t2, $0, endw		# mdor != 0
	bge	$t1, 4, endw		# i < 4
	
	li 	$t6, 0x00000001
	and 	$t5, $t2, $t6		
	
if:	beq 	$t5, $0, endif		# if( (mdor & 0x00000001) != 0 )
	add	$t0, $t0, $t3		# res = res + mdo;
endif:	
	
	sll	$t3, $t3, 1		# mdo = mdo << 1;
	srl 	$t2, $t2, 1		# mdor = mdor >> 1;
	
	addi 	$t1, $t1, 1		# i++;
	
	j while	
endw:
	ori 	$v0, $0, print_string	# 
	la	$a0, str2		#
	syscall				# print_string("Resultado: ");
	
	ori	$v0, $0, print_int10	#
	move 	$a0, $t0		#
	syscall				# print_int10(res);	
	
	jr $ra