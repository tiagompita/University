# Mapa de registos
# i :		$t0
# dup_counter: 	$t1
#
# array: 	$s0
# array[i]: 	$t3
#
# aux_array:	$s1
# aux_array[i]: $t5
	
	.eqv SIZE, 10
	.data
str1:	.asciiz	"array["
str2:	.asciiz	"]="
str3:	.asciiz	"*, "
str4:	.asciiz	", "
str5:	.asciiz	"\n# repetidos: "
	.align 2
array:	.space 40
aux_array: .space 40
	.text
	.globl main
	
main:	addi	$sp, $sp, -4		#
	sw	$ra, 0($sp)		# Salvaguarda o $ra
	
	li	$t0, 0			# i = 0
	la	$s1, aux_array		#
	
for3:	bge	$t0, SIZE, endfor3	# while ( i < SIZE )
	
	la	$a0, str1		#
	li	$v0, 4			#
	syscall				# print_string("array[")
	
	move	$a0, $t0		#
	li	$v0, 1			#
	syscall				# print_int10(i);
	
	la	$a0, str2		#
	li	$v0, 4			#
	syscall				# print_string("]=")
	
	la	$s0, array		#
	sll	$t9, $t0, 2		# i * 4
	add	$t3, $s0, $t9		# &array+i
	
	li 	$v0, 5			#
	syscall				# read_int()
	
	sw	$v0, 0($t3)		# array[i]=read_int();
	
	addi	$t0, $t0, 1		# i++
	j for3
endfor3:
	
	move	$a0, $s0		#
	move	$a1, $s1		#
	li	$a2, SIZE		#
	
	jal find_duplicates		# find_duplicates(array, aux_array, SIZE);
	
	
	li	$t0, 0			# i = 0
	li	$t1, 0			# dup_counter = 0
for4:	bge	$t0, SIZE, endfor4	# while ( i < SIZE )

	la	$s1, aux_array		#
	sll	$t9, $t0, 2		# i * 4
	add	$t5, $s1, $t9		# &aux_array+i
	lw	$t5, 0($t5)		# aux_array[i]
	
if2:	blt	$t5, 2, else2		# if(aux_array[i] >= 2)
	
	la	$a0, str3		#
	li	$v0, 4			#
	syscall				# print_string("*, ")
	
	addi	$t1, $t1, 1		# dup_counter++
	
	j endif2
else2:

	la	$s0, array		#
	sll	$t9, $t0, 2		# i * 4
	add	$t3, $s0, $t9		# &array+i
	lw	$t3, 0($t3)		# array[i]
	
	move	$a0, $t3		#
	li	$v0, 1			#
	syscall				# print_int10(array[i]);
	
	la	$a0, str4		#
	li	$v0, 4			#
	syscall				# print_string(", ")
	
endif2:

	addi	$t0, $t0, 1		# i++
	j for4
endfor4:
	
	la	$a0, str5		#
	li	$v0, 4			#
	syscall				# print_string("\n# repetidos: ");
	
	move	$a0, $t1		#
	li	$v0, 1			#
	syscall				# print_int10(dup_counter);
	
	lw	$ra, 0($sp)		#
	addi	$sp, $sp, 4		#
	li	$v0, 0			# return 0
	jr $ra

#########################################

# Mapa de registos
# array	:	$a0
# array[i]:	$t4
# array[j]:	$t5
#
# dup_array :	$a1
# dup_array[i]: $t3
# dup_array[j]: $t6
#
# size :	$a2
#
# i :		$t0
# j :		$t1
# token : 	$t2

find_duplicates:
	li	$t0, 0			# i = 0
for:	bge	$t0, $a2, endfor	# while ( i < size ) {

	sll	$t9, $t0, 2		# i * 4
	add	$t3, $a1, $t9		# &dup_array+i
	sw	$0, 0($t3)		# dup_array[i] = 0

	li	$t1, 0			# j = 0
	li	$t2, 1			# token = 1
for2:	bge	$t1, $a2, endfor2	# while (j < size)

	sll	$t8, $t0, 2		# i * 4
	add	$t4, $a0, $t8		# &array+i
	lw	$t4, 0($t4)		# array[i]	
	
	sll	$t7, $t1, 2		# j * 4
	add	$t5, $a0, $t7		# &array+j
	lw	$t5, 0($t5)		# array[j]	
	
if:	bne	$t4, $t5, endif		# if(array[i] == array[j])
	
	sll	$t6, $t1, 2		# j * 4
	add	$t6, $a1, $t6		# &dup_array+j
	sw	$t2, 0($t6)		# dup_array[j] = token
	
	addi	$t2, $t2, 1		# token++
	
	j endif
endif:
	addi	$t1, $t1, 1		# j++;
	j for2				
endfor2:				# }

	addi	$t0, $t0, 1		# i++;
	j for				
endfor:					# }

	jr $ra