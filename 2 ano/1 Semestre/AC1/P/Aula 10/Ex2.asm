	.data
msg1: 	.asciiz "\nRaiz quadrada de "
nline: 	.asciiz "\n
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salva guarda $ra
	
	li	$v0, 7			#
	syscall				# read_double()
	mov.d	$f12, $f0		
	
	jal 	sqrt			# sqrt(read_double())
	
	la	$a0, msg1		#
	li	$v0, 4			#
	syscall				# print_string("\nRaiz quadrada de ")
	
	mov.d	$f12, $f0
	li	$v0, 3			#
	syscall				# print_double()
	
	lw	$ra, 0($sp)		# Repoe $ra
	addiu	$sp, $sp, 4		#
	
	jr 	$ra

#########################################

# Mapa de registos
#
# val :		$f12
# xn :		$f0
# aux:		$f2
# i :		$t0

	.data
const1:	.double 1.0
const2:	.double 0.0
const3: .double 0.5
	.text

sqrt:	addiu	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra

	la	$t1, const1		#
	l.d	$f0, 0($t1)		# xn = 1.0
	l.d	$f2, 0($t1)		# aux = 1.0
	li	$t0, 0			# i = 0
	
	la	$t1, const2		#
	l.d	$f4, 0($t1)		# $f4 = 0.0
if:	c.le.d	$f12, $f4		# if(val > 0.0)
	bc1t	else			# 
	
do:	mov.d	$f2, $f0		#
	div.d	$f4, $f12, $f0		# val/xn
	add.d	$f4, $f0, $f4		# xn + val/xn
	
	la	$t1, const3		#
	l.d	$f6, 0($t1)		#
	mul.d	$f0, $f6, $f4		#
	
	c.eq.d	$f0, $f2		#
	bc1t	endif			# Se iguais, sai do loop
	
	addi	$t0, $t0, 1		#
	li	$t1, 25			#
	blt	$t0, $t1, do		# Se i < 25, volta ao loop
	
	j endif
else:
	la	$t1, const2		#
	l.d	$f0, 0($t1)		# xn = 0.0
endif:

	lw	$ra, 0($sp)		# Repoe $ra
	addiu	$sp, $sp, 4

	jr $ra		# return xn