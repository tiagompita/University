# Mapa de registos
#  p:	$t2
# *p:	$t3

strcat:	addiu	$sp, $sp, -8		# Criar espaço na Stack
	sw	$ra, 0($sp)		# Salvaguardar $ra
	sw	$a0, 4($sp)		# Salvaguarda dst
	

	move	$t2, $a0		# p = dst

while:	lb	$t3, 0($t2)		# *p
	beq	$t3, '\0', endw		# while(*p != '\0')
	addi	$t2, $t2, 1		# p++;
	j while
endw:
	move    $a0, $t2           	# $a0 = p (fim da string dst)
	jal strcpy			#

	lw	$a0, 4($sp)		#
	lw	$ra, 0($sp)		#
	addiu	$sp, $sp, 8		# Repor a Stack
	
	move 	$v0, $a0		# return dst
	
	jr $ra				# exit