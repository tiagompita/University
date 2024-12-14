	.data
const1:	.double 0.35
	.align 3
xyz:	.asciiz "Str_1"
	.space 8
	.word 2023
	.double 2.718281828459045
	.asciiz	"Str_2"
	.space 11
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4			#
	sw	$ra, 0($sp)			#
	
	la	$a0, xyz			#
	jal 	f2				# f2(&xyz)
	
	mov.d	$f12, $f0			#
	li	$v0, 3				#
	syscall					#
	
	lw	$ra, 0($sp)			#
	addiu	$sp, $sp, 4			#
	
	li	$v0, 0				# return 0

	jr	$ra

# Mapa de registos
#
# *p = xyz	
			
f2:	addi	$t0, $a0, 16			#
	lw	$t0, 0($t0)			# p -> i
	mtc1	$t0, $f2			#
	cvt.d.w	$f2, $f2			# (double) p->i
	
	addi	$t1, $a0, 24			#
	l.d	$f4, 0($t1)			# p -> g
	
	la	$t2, const1			#
	l.d	$f6, 0($t2)			#
	
	mul.d	$f0, $f4, $f2			# p->g * (double)p->i
	div.d	$f0, $f0, $f6			# return p->g * (double)p->i / 0.35
	
	jr	$ra