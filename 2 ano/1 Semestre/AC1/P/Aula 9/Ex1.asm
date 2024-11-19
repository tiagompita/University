#Mapa de registos
# res: 		$f0
# val: 		$t0
#

	.data
const1:	.float 2.59375
const2:	.float 0.0
	.text
	.globl main
	
main:
do:	li	$v0, 5			# do {
	syscall				# 
	move	$t0, $v0		# val = read_int()
	
	mtc1	$t0, $f0		#
	cvt.s.w	$f0, $f0		# $f0 = (float)val
	
	la	$t1, const1		# $t1 = $const1
	l.s	$f2, 0($t1)		# $f2 = 2.59375
	
	mul.s	$f0, $f0, $f2		# res = (float)val * 2.59375
	
	la	$t1, const2		# $t1 = $const2
	l.s	$f2, 0($t1)		# $f2 = 0.0
	
	li	$v0, 2			#
	mov.s	$f12, $f0		#
	syscall				# print_float( res )
	
	c.eq.s	$f0, $f2		# 
	bc1f	do			# while ( res != 0.0 )

endw:					# }
	li 	$v0, 0			# return 0
	jr $ra	