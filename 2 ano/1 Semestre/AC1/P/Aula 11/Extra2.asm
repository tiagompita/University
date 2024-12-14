	.data
	.align 3
uvw:	.asciiz "St1"
	.space 10
	.double 3.141592653589
	.word 291, 756
	.byte 'X'
	.float 1.983
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4			#
	sw	$ra, 0($sp)			# Salvaguarda $ra
	
	jal	f1				#
	
	mov.s	$f12, $f0			#
	li	$v0, 2				#
	syscall					# print_float(f1())
	
	lw	$ra, 0($sp)			# Repoe $ra
	addiu	$sp, $sp, 4			#

	li	$v0, 0			# return 0
	jr	$ra			

#################################################

f1:	la	$t0, uvw			#
	addi	$t1, $t0, 16			# 
	l.d	$f2, 0($t1)			# s1.g
	
	addi	$t2, $t0, 24			# 
	lw	$t2, 0($t2)			# s1.a2[1]
	
	mtc1	$t2, $f4			#
	cvt.d.w	$f4, $f4			# (double)s1.a2[1]
	
	addi	$t3, $t0, 36			#
	l.s	$f6, 0($t3)			# s1.k
	cvt.d.s	$f6, $f6			# (double)s1.k
	
	mul.d	$f0, $f2,$f4			# s1.g * (double)s1.a2[1]
	div.d	$f0, $f0, $f6			# s1.g * (double)s1.a2[1] / (double)s1.k
	
	cvt.w.d $f0, $f0			# return (float) (s1.g * (double)s1.a2[1] / (double)s1.k)
	
	jr 	$ra
