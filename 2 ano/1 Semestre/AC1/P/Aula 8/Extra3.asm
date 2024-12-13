	.data
msg1:	.asciiz	"Enter a string: "
msg2:	.asciiz	"Enter a string to insert: "
msg3:	.asciiz	"Enter the position: "
msg4:	.asciiz	"Original string: "
msg5:	.asciiz	"\nModified string: "
msg6:	.asciiz "\n"
str1:	.space 101
str2:	.space 51
	.text
	.globl main
	
main:	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		#
	
	la	$a0, msg1		#
	li	$v0, 4			#
	syscall				# print_string("Enter a string: ");
	
	la	$a0, str1		#
	li	$a1, 50			#
	li	$v0, 8			#
	syscall				# read_string(str1, 50);
	
	la	$a0, msg2		#
	li	$v0, 4			#
	syscall				# print_string("Enter a string to insert: ");
	
	la	$a0, str2		#
	li	$a1, 50			#
	li	$v0, 8			#
	syscall				# read_string(str2, 50);
	
	la	$a0, msg3		#
	li	$v0, 4			#
	syscall				# print_string("Enter the position: ");
	
	li	$v0, 5			#
	syscall				# read_int()
	move	$t0, $v0		# insert_pos = read_int()
	
	la	$a0, msg4		#
	li	$v0, 4			#
	syscall				# print_string("Original string: ");
	
	la	$a0, str1		#
	li	$v0, 4			#
	syscall				# print_string(str1);
	
	la	$a0, str1		#
	la	$a1, str2		#
	move	$a2, $t0		#
	
	jal insert			# insert(str1, str2, insert_pos);
	
	
	la	$a0, msg5		#
	li	$v0, 4			#
	syscall				# print_string("\nModified string: ");
	
	la	$a0, str1		#
	li	$v0, 4			#
	syscall				# print_string(str1);
	
	la	$a0, msg6		#
	li	$v0, 4			#
	syscall				# print_string("\n");
	
	lw	$ra, 0($sp)		#
	addi	$sp, $sp, 4		#

	li 	$v0, 0			# return 0
	jr	$ra
	

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
	move	$t1, $v0		# len_dst = strlen(dst)
	
	move	$a0, $s1		# 
	jal 	strlen			# strlen(src)
	move	$t2, $v0		# len_src = strlen(src)
	
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