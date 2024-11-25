	.data
str1:	.asciiz "Arquitetura de "
str3:	.asciiz "Computadores I"
str2:	.space 50
nline:	.asciiz "\n"
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4		# Reserva espaço na stack
	sw	$ra, 0($sp)		# Salvaguarda $ra

	la	$a0, str2		#
	la	$a1, str1		#
	
	jal strcpy			# strcpy(str2, str1)
	
	move  	$a0, $v0		#
	li	$v0, 4			# 
	syscall				# print_string(str2);
	
	la	$a0, nline		#
	li	$v0, 4			#
	syscall				# print_string("\n");
	
	la	$a0, str2		#
	la	$a1, str3		#
	jal	strcat			# strcat(str2, "Computadores I")
	
	move  	$a0, $v0		#
	li	$v0, 4			# 
	syscall				# print_string(	strcat(str2, "Computadores I")	)
	
	lw	$ra, 0($sp)		# Repoe $ra
	addiu	$sp, $sp, 4		# Limpa o espaço na stack
	jr $ra
	
#########################################

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
	
#########################################

# Mapa de Registos
# dst:	$a0
# src:	$t0
# *p:	$t1
#

strcpy:
    	move    $t1, $a0        	# p = dst
    	move    $t0, $a1        	# $t0 = src

do:
    	lb      $t6, 0($t0)     	# *src 
    	sb      $t6, 0($t1)     	# *p = *src 

    	addiu   $t0, $t0, 1     	# src++
    	addiu   $t1, $t1, 1     	# p++

	lb      $t6, 0($t0)     	# *src++
    	bne     $t6, '\0', do   	# while (*src++ != '\0')

    	move    $v0, $a0        	# return dst
    	jr      $ra             	# exit