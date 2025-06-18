# Mapa de registos
# 
# i: 	$t0
# a:	$s1
# a[i]: $t2
	.data
	.eqv SIZE, 10
nline:	.asciiz	"\n"
	.align 3
a:	.space 80 		# 10 * 8
const1:	.double 0.0
	.text
	.globl main
	
main:	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra
	
	li	$t0, 0			# i = 0
for:	bge	$t0, SIZE, endfor	# while ( i < SIZE ) {
	
	la	$s1, a			# $t1 = a
	sll	$t3, $t0, 3		# $t3 ( temp ) = i * 8
	add	$t2, $t3, $s1		# &a[i]
	
	li	$v0, 7			#
	syscall				# read_double()
	s.d	$f0, 0($t2)		# a[i] = read_double();
	
	
	addi	$t0, $t0, 1		# i++
	j for				# }
endfor:

	move	$a0, $s1		#
	li	$t4, SIZE		#
	move	$a1, $t4		#
	jal 	average

	mov.d	$f12, $f0		#
	li	$v0, 3			#
	syscall				# print_double( average(a, SIZE) );
	
	move	$a0, $s1		#
	li	$t4, SIZE		#
	move	$a1, $t4		#
	jal	max			
	
	la	$a0, nline		#
	li	$v0, 4			#
	syscall				#
	
	mov.d	$f12, $f0		#
	li	$v0, 3			#
	syscall				# print_double( max(a, SIZE) );
	
	move	$a0, $s1		#
	li	$t4, SIZE		#
	move	$a1, $t4		#
	jal	median			
	
	la	$a0, nline		#
	li	$v0, 4			#
	syscall				#
	
	mov.d	$f12, $f0		#
	li	$v0, 3			#
	syscall				# print_double( median(a, SIZE) );
	
	
	lw	$ra, 0($sp)		# Repoe $ra
	addi	$sp, $sp, 4		#

	li	$v0, 0			# return 0
	
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

# Mapa de registos
#
# *array :	$a0
# nval:		$a1
#
# houveTroca:	$t0
# i:		$t1
# &array[i]:	$t2
# array[i]:	$f4
# array[i+1]:	$f6
# aux:		$f2

	.data
	.eqv TRUE, 1
	.eqv FALSE, 0
	.text

median:	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra
	
do:					# {
	li	$t0, FALSE		# houveTroca = FALSE
	li	$t1, 0			# i = 0
	
	addiu	$t3, $a1, -1		# nval - 1
for4:	bge	$t1, $t3, endfor4	#

	sll	$t9, $t1, 3		# i * 8
	add	$t2, $a0, $t9		# &array[i]
	l.d	$f4, 0($t2)		# array[i]
	l.d	$f6, 8($t2)		# array[i+1]	
	
if2:	c.le.d	$f4, $f6		#
	bc1f	endif			# if( array[i] > array[i+1] )
	
	mov.d	$f2, $f4		# aux = array[i];
	mov.d	$f4, $f6		# array[i] = array[i+1];
	mov.d	$f6, $f2		# array[i+1] = aux;

	li	$t0, TRUE		# houveTroca = TRUE
endif2:

	addi	$t1, $t1, 1		# i++
	j for4
endfor4:
	beq	$t0, TRUE, do		# } while( houveTroca == TRUE );
	
	divu	$t4, $a1, 2		# $t4 = nval / 2
	sll	$t4, $t4, 3		# (nval / 2 ) * 8
	add	$t5, $a0, $t4		# &array[nval / 2]
	
	l.d	$f0, 0($t5)		# return array[nval / 2]
	
	lw	$ra, 0($sp)		# Repoe $ra
	addi	$sp, $sp, 4		#
	
	jr	$ra	
			
#########################################	
	
# Mapa de registos
#
# p :	$a0
# n :	$a1
# u : 	$t0
# max : $f0

max:	addi	$a1, $a1, -1		# n-1
	
	sll	$t1, $a1, 3		# (n-1) * 8
	add	$t0, $a0, $t1		# *u = p+n-1
	
	l.d	$f0, 8($a0)		# max = *p++
	
for3:	bgt	$a0, $t0, endfor3	# while ( p <= u ) {

if:	l.d	$f2, 0($a0)		# $f2 = *p
	c.le.d	$f2, $f0		# if (*p > max)
    	bc1t	endif			# skip if not
	
	mov.d	$f0, $f2		# max = *p
endif:
	addi	$a0, $a0, 8		# p++
	j for3				# }
endfor3:

	jr $ra