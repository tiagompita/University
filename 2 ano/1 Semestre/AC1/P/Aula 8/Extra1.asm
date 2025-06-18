	.data
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4		# Salvaguardar $ra
	sw	$ra, 0($sp)		#
	
	li	$a0, 0x8000		#
	li	$a1, 0x8000		#
	
	jal	f_div			# div(unsigned int dividendo, unsigned int divisor)
	
	move	$a0, $v0		#
	li	$v0, 1			#
	syscall				# print_int10( div(...) )
	
	lw	$ra, 0($sp)		#
	addiu	$sp, $sp, 4		#

	li	$v0, 0			# return 0;
	jr 	$ra

# Mapa de registos
# dividendo:	$a0 
# divisor:	$a1
# i:		$t0
# bit:		$t1
# quociente:	$t2
# resto:	$t3

f_div:	sll	$a1, $a1, 16		# divisor = divisor << 16;
	andi	$a0, $a0, 0xFFFF	# dividendo = dividendo & 0xFFFF
	sll	$a0, $a0, 1		# dividendo = (dividendo & 0xFFFF) << 1
	
	li	$t0, 0			# i = 0
for:	bge	$t0, 16, endfor		# while( i < 16 )
	li	$t1, 0			# bit = 0
	
if:	blt	$a0, $a1, endif		# if(dividendo >= divisor)
	sub	$a0, $a0, $a1		# dividendo = dividendo - divisor
	
	li	$t1, 1			#

	j endif				
endif:
	sll	$a0, $a0, 1		# dividendo = (dividendo << 1)
	or	$a0, $a0, $t1		# dividendo = (dividendo << 1) | bit

	addi	$t0, $t0, 1		# i++
	j for
endfor:

	srl	$t3, $a0, 1		# resto = (dividendo >> 1)
	li	$t4, 0xFFFF0000		
	and	$t3, $t3, $t4		# resto = (dividendo >> 1) & 0xFFFF0000
	
	andi	$t2, $a0, 0xFFFF	# quociente = dividendo & 0xFFFF
	
	or	$v0, $t3, $t2		# return (resto | quociente)
	
	jr	$ra