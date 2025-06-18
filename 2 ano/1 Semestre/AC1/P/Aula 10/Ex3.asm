#Mapa de registos
#
# i:	$t0
# arr:	$s0
# arr[i]: $f0
	.data
	.eqv SIZE, 10
	.align 3
arr:	.space	80		# 10 * 8
	.text
	.globl main
	
main:	addiu 	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra
	
	la	$s0, arr		# load array
	
	li	$t0, 0			# i = 0
for:	bge	$t0, SIZE, endfor	# while ( i < SIZE ) {

	li	$v0, 7			# 
	syscall				# read_double()
	
	sll	$t1, $t0, 3		# i * 8
	add	$t2, $t1, $s0		# &array[i]
	s.d	$f0, 0($t2)		# array[i] = read_double()

	addiu	$t0, $t0, 1		# i++
	j for
endfor:

	move	$a0, $s0		#
	li	$a1, SIZE		#
	jal 	average			# average(arr, SIZE)
	
	mov.d	$f12, $f0		#
	li	$v0, 3			#
	syscall				# print_double( average(arr, SIZE) )
	
	move	$a0, $s0		#
	li	$a1, SIZE		#
	jal 	var			# var(arr, SIZE)
	
	mov.d	$f12, $f0		#
	li	$v0, 3			#
	syscall				# print_double( var(arr, SIZE) )
	
	move	$a0, $s0		#
	li	$a1, SIZE		#
	jal 	stdev			# stdev(arr, SIZE)
	
	mov.d	$f12, $f0		#
	li	$v0, 3			#
	syscall				# print_double( stdev(arr, SIZE) )
	
	lw	$ra, 0($sp)		# Repoe $ra
	addiu	$sp, $sp, 4		#
	
	jr	$ra
	
#########################################

# Mapa de registo
#
# array :	$a0
# n :		$a1

average:
	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		#

	addiu	$t0, $a1, -1		# i = n-1
	
	la	$t1, const1		#
	l.d	$f0, 0($t1)		# sum = 0.0
	
for2:	bltz	$t0, endfor2		#

	sll	$t3, $t0, 3		# i * 8
	add	$t2, $t3, $a0		# &array[i]
	
	l.d	$f2, 0($t2)		# array[i]
	
	add.d	$f0, $f0, $f2		# sum += array[i]

	addi	$t0, $t0, -1		# i--
	j for2
endfor2:
	
	mtc1	$a1, $f6		# $f6 = n
	cvt.d.w $f4, $f6		# $f4 = (double)n
	
	div.d	$f0, $f0, $f4		#

	lw	$ra, 0($sp)		#
	addi	$sp, $sp, 4		#

	jr	$ra

#########################################

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
for11:	bge	$t0, $v0, endfor11		# while ( i < abs(y) )
	
if:	blez 	$a0, else		# if(y > 0)
	mul.s	$f0, $f0, $f12		# result *= x;
	j endif
else:
	div.s	$f0, $f0, $f12		# result /= x;
endif:
	addi	$t0, $t0, 1		
	j for11
endfor11:					
	
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
			
#########################################

# Mapa de registos
#
# array :	$a0
# nval:		$a1
# i:		$t0
# media:	$f2
# soma:		$f4
# array[i]:	$f6

	.data
const11: .float 0.0
	.text

var:	addiu	$sp, $sp, -4		#
	sw	$ra, 0($sp)		#

	jal	average
	cvt.s.d $f2,$f0			# media = (float)average(array, nval)
	
	la	$t1, const11		#
	l.s	$f4, 0($t1)		# soma = 0.0
	li	$t0, 0			# i = 0
for22:	bge	$t0, $a1, endfor22	# while ( i < nval )
	
	sll	$t1, $t0, 3		# i * 8
	add	$t2, $a0, $t1		# &array[i]
	l.d	$f6, 0($t2)		# array[i]
	cvt.s.d	$f6, $f6		# (float)array[i]
	
	sub.s	$f12, $f6, $f2		# (float)array[i] - media
	li	$a0, 2
	jal	xtoy			# xtoy((float)array[i] - media, 2);
	
	add.s	$f4, $f4, $f0		# soma += xtoy((float)array[i] - media, 2);
	
	addiu	$t0, $t0, 1		# i++
	j for22
endfor22:
	cvt.d.s $f4, $f4		# (double)soma
	mtc1 	$a1, $f8		# (double)nval
	
	div.s	$f0,$f4,$f8		# return (double)soma / (double)nval
	
	lw	$ra, 0($sp)		#
	addiu	$sp, $sp, 4		#
	
	jr	$ra

#########################################

# Mapa de registos
#
# val :		$f12
# xn :		$f0
# aux:		$f2
# i :		$t0

	.data
const111:	.double 1.0
const2:	.double 0.0
const3: .double 0.5
	.text

sqrt:	addiu	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra

	la	$t1, const111		#
	l.d	$f0, 0($t1)		# xn = 1.0
	l.d	$f2, 0($t1)		# aux = 1.0
	li	$t0, 0			# i = 0
	
	la	$t1, const2		#
	l.d	$f4, 0($t1)		# $f4 = 0.0
if2:	c.le.d	$f12, $f4		# if(val > 0.0)
	bc1t	else2			# 
	
do:	mov.d	$f2, $f0		#
	div.d	$f4, $f12, $f0		# val/xn
	add.d	$f4, $f0, $f4		# xn + val/xn
	
	la	$t1, const3		#
	l.d	$f6, 0($t1)		#
	mul.d	$f0, $f6, $f4		#
	
	c.eq.d	$f0, $f2		#
	bc1t	endif2			# Se iguais, sai do loop
	
	addi	$t0, $t0, 1		#
	li	$t1, 25			#
	blt	$t0, $t1, do		# Se i < 25, volta ao loop
	
	j endif2
else2:
	la	$t1, const2		#
	l.d	$f0, 0($t1)		# xn = 0.0
endif2:

	lw	$ra, 0($sp)		# Repoe $ra
	addiu	$sp, $sp, 4

	jr $ra		# return xn
			
#########################################

# Mapa de registos
#
# array: 	$a0
# nval:		$a1

stdev:	
	jal	var			#
	
	mov.d	$f12, $f0		#
	
	jal 	sqrt			#
	
	jr	$ra