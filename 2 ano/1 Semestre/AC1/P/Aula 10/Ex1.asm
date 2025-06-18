	.data
msg1:	.asciiz "\nTesting x^y"
msg2:	.asciiz	"\nEnter the value of x: "
msg3:	.asciiz	"\nEnter the value of y: "
msg4:	.asciiz	"x^y = "
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra

	la	$a0, msg1		#
	li	$v0, 4			#
	syscall				# print_string("Testing x^y\n")
	
	la	$a0, msg2		#
	li	$v0, 4			#
	syscall				# print_string("Enter the value of x: ")
	
	li	$v0, 6			#
	syscall				# read_float()
	mov.s 	$f12, $f0		# $f12 = read_float()
	
	la	$a0, msg3		#
	li	$v0, 4			#
	syscall				# print_string("Enter the value of y: ")
	
	li	$v0, 5			#
	syscall				# read_int()
	move	$a0, $v0		
	
	jal	xtoy			# result = xtoy(x, y)
	
	la	$a0, msg4		#
	li	$v0, 4			#
	syscall				# print_string("x^y = ")
	
	li	$v0, 2			#
	mov.s	$f12, $f0		#
	syscall				# print_float(result)

	lw	$ra, 0($sp)		# Repoe $ra
	addiu	$sp, $sp, 4		#

	jr	$ra

#########################################

# Mapa de registos
#
# x:		$f12
# y:		$a0
# i:		$t0
# result:	$f0

	.data
const1:	.float 1.0
	.text

xtoy:	addiu	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra

	li	$t0, 0			# i = 0
	la	$t1, const1		#
	l.s	$f0, 0($t1)		# result = 1.0
	
	jal	abs			# abs(y)
for:	bge	$t0, $v0, endfor		# while ( i < abs(y) )
	
if:	blez 	$a0, else		# if(y > 0)
	mul.s	$f0, $f0, $f12		# result *= x;
	j endif
else:
	div.s	$f0, $f0, $f12		# result /= x;
endif:
	addi	$t0, $t0, 1		
	j for
endfor:					
	
	lw	$ra, 0($sp)		#
	addiu	$sp, $sp, 4		#
	
	jr	$ra			# return result
	
#########################################

# Mapa de registos
#
# val = $a0

abs:	bge	$a0, $0, endif1		# if(val < 0)
	sub	$a0, $0, $a0		# val = -val;
endif1:
	move	$v0, $a0		# return val
	
	jr 	$ra