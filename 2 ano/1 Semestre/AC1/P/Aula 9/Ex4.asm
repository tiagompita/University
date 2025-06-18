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