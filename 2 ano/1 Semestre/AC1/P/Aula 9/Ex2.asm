# Mapa de registos
# ft :	$f0
# ct : 	$f2

	.data
const1:	.double 5.0
const2: .double 9.0
const3: .double 32.0
const4: .double 0.0
const5: .double 100.0
	.text
	.globl main
	
main:	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda $ra
	
	la	$t0, const4		#
	l.d	$f0, 0($t0)		# ft = 0.0
	l.d	$f2, 0($t0)		# ct = 0.0
	
while:	la	$t0, const5		#
	l.d	$f4, 0($t0)		# temp = 100.0
	c.le.d	$f2, $f4		#
	bc1f	endwhile		# while(ct <= 100.0) {
	
	li	$v0, 7			#
	syscall				# read_double()
	
	mov.d	$f12, $f0		#
	jal 	f2c			# 
	mov.d	$f2, $f0		# ct = f2c(ft)
	
	li 	$v0, 3			#
	mov.d	$f12, $f0		#
	syscall				# print_double(ct)
	
endwhile:
	
	lw	$ra, 0($sp)		#
	addi	$sp, $sp, 4		#

	li	$v0, 0			# return 0
	
	jr $ra
	
#########################################	
	
# Mapa de registos
# ft :	$f12

f2c:	la	$t0, const1		#
	l.d	$f4, 0($t0)		# $f6 = 5.0
	
	la	$t0, const2		#
	l.d	$f6, 0($t0)		# $f8 = 9.0
	
	la	$t0, const3		#
	l.d	$f8, 0($t0)		# $f8 = 32.0
	
	sub.d	$f10, $f12, $f8		# $f10 = ft - 32.0
    
    	div.d	$f8, $f4, $f6		# $f8 = 5.0 / 9.0
    
    	mul.d	$f0, $f8, $f10		# $f0 = 5.0 / 9.0 * (ft - 32.0)
	
	jr	$ra