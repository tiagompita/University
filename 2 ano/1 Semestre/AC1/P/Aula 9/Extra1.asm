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