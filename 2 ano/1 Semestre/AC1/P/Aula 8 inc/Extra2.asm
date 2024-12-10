	.data
dst:    .asciiz "AQUI: "           	# String destino
src:    .asciiz "inserida"   		# String de origem
pos:    .word 6              		# Posição onde a string será inserida
msg:    .asciiz "\nResultado: " 	# Mensagem para imprimir o resultado
	.text
	.globl main
	
main:	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		#
	
	la	$a0, dst		#
	la	$a1, src		#
	la	$a2, pos		#
	
	jal	insert			# char *insert(char *dst, char *src, int pos)
	
	move	$v0, $t0		# Salvaguardar o retorno da funçao insert
	
	la	$a0, msg		#
	li	$v0, 4			#
	syscall				# print_string(msg)
	
	move	$t0, $a0		#
	li	$v0, 4			#
	syscall				# print_string( insert (...) )
	
	lw	$ra, 0($sp)		#
	addi	$sp, $sp, 4		#

	jr $ra

#########################################

# Mapa de registos
# dst : $a0 -> $s0
# src : $a1 -> $s1
# pos : $a2 -> $s2
# *p  : $t0
# len_dst: $t1
# len_src: $t2
# i : $t3

insert:	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		#

	move	$t0, $a0		# char *p = dst
	move	$s0, $a0		#
	move	$s1, $a1		#
	move	$s2, $a2		#
	
	jal	strlen			# strlen(dst)
	move	$v0, $t1		# len_dst = strlen(dst)
	
	move	$a0, $s1		# 
	jal 	strlen			# strlen(src)
	move	$v0, $t2		# len_src = strlen(src)
	
if:	bgt	$s2, $t1, endif		# if(pos <= len_dst)

	move	$t3, $t1		# i = len_dst
for:	blt	$t3, $s2, endfor		# while ( i >= pos )
	
	add	$t4, $t3, $t2		# i + len_src
	add	$t5, $s0, $t3		# dst+i
	lb	$t6, 0($t5)		# dst[i]
	
	add	$t7, $s0, $t4		# dst +i+len_src
	
	sb	$t6, 0($t7)		# dst[i + len_src] = dst[i]
	
	addi	$t3, $t3, -1		# i--
	j	for			#
endfor:

	li 	$t3, 0			# i = 0 
for2:	bge	$t3, $t2, endfor2	# while ( i < len_src )
	
	add	$t4, $t3, $s1		# src+i
	lb	$t5, 0($t4)		# src[i]
	
	add	$t6, $t3, $s2		# i + pos
	add	$t7, $s0, $t6		# dst +i +pos
	sb	$t5, 0($t7)		# dst[i + pos] = src[i];
	
	addi	$t3, $t3, 1		#
	j for2
endfor2:
	j endif
endif:
	
	lw	$ra, 0($sp)		#
	addi	$sp, $sp, 4		#
	
	move 	$v0, $t0
	
	jr 	$ra

#########################################

strlen: li 	$t1, 0 			# len = 0;
while: 	lb 	$t0, 0($a0) 		# while(*s++ != '\0')
	addiu 	$a0,$a0,1 		#
	
	beq 	$t0, '\0', endw 	# {
	addi 	$t1, $t1, 1		# len++;
	j while 			# }
	
endw: 	move 	$v0,$t1			# return len;
	jr 	$ra