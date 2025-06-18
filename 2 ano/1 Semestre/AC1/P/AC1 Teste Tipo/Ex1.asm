# Mapa de registos
# val:	$t0
# n:	$t1
# min:	$t2
# max: 	$t3

	.data
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	.eqv read_int, 5
str:	.asciiz	"Digite ate 20 inteiros (zero para terminar):"
str2:	.asciiz	"Maximo/minimo sao: "
	.text
	.globl main
	
main:	li	$t1, 0			# n = 0
	li	$t2, 0x7FFFFFFF		# min = 0x7FFFFFFF
	li	$t3, 0x80000000		# max = 0x80000000
	
	li	$v0, print_string	#
	la	$a0, str		#
	syscall				# print_string("Digite ate 20 inteiros (zero para terminar):")
	
do:	li	$v0, read_int		#
	syscall				# read_int()
	move 	$t0, $v0		# val = read_int()
	
if:	beq	$t0, $0, endif		# if ( val != 0 )
	
ifmax:	ble	$t0, $t3, ifmin		# if (val > max)
	move	$t3, $t0		# max = val
	
ifmin:	bge	$t0, $t2, endif		# if ( val < min )
	move	$t2, $t0		# min = val
	
endif:
	addi	$t1, $t1, 1		# n++
	
while:	bge	$t1, 20, enddo		# while{ ( n < 20 ) &&
	bne	$t0, $0, do		#	( val != 0 ) }
		
enddo:	
	li 	$v0, print_string	#
	la 	$a0, str2		#
	syscall				# print_string("Maximo/minimo sao: ")
	
	li 	$v0, print_int10	#
	move	$a0, $t3		#
	syscall				# print_int10(max)
	
	li 	$v0, print_char		#
	li	$a0, ':'		#
	syscall				# print_char(':')
	
	li 	$v0, print_int10	#
	move	$a0, $t2		#
	syscall				# print_int10(min)
	
	jr $ra