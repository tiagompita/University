# Mapa de registos
# 
# i:		$t0
# i * 4:	$t9
# array_size:	$s1
# insert_value:	$s2
# insert_pos:	$s3
# array: 	$s4
# array+i:	$t5

	.data
	.align 2
array:	.space 200			# 50 * 4 bytes (word)
str1:	.asciiz "Size of array : "
str2:	.asciiz	"array["
str3:	.asciiz "] = "
str4:	.asciiz	"Enter the value to be inserted: "
str5:	.asciiz	"Enter the position: "
str6: 	.asciiz "\nOriginal array: "
str7:	.asciiz	"\nModified array: "
	.text
	.globl main

main:	addiu	$sp, $sp, -4		# Criar espaço na stack
	sw	$ra, 0($sp)							# Salvaguarda $ra

	
	la	$a0, str1		#
	li 	$v0, 4			#
	syscall				# print_string("Size of array : ")
	
	li	$v0, 5			#
	syscall				# read_int()
	
	move 	$s1, $v0		# array_size = read_int()
	
	li	$t0, 0			# i = 0
	
for:	bge	$t0, $s1, endfor	# for(i=0; i < array_size; i++)
	
	li	$v0, 4			#
	la	$a0, str2		#
	syscall				# print_string("array[")
	
	li	$v0, 1			#
	move	$a0, $t0		#
	syscall				# print_int10(i)
	
	li	$v0, 4			#
	la	$a0, str3		#
	syscall				# print_string("] = ")
	
	sll	$t9, $t0, 2		# i * 4
	la	$s4, array		# $t4 = array
	
	addu	$t5, $s4, $t9		# array+i
	
	li	$v0, 5			#
	syscall				# read_int()
	
	sw	$v0, 0($t5)		# array[i] = read_int()
	
	addi	$t0, $t0, 1		# i++
	j for
endfor:
	
	li	$v0, 4			#
	la	$a0, str4		#
	syscall				# print_string("Enter the value to be inserted: ");
	
	li	$v0, 5			#
	syscall				# read_int()
	move	$s2, $v0		# insert_value = read_int()
	
	
	li	$v0, 4			#
	la	$a0, str5		#
	syscall				# print_string("Enter the position: ");
	
	li	$v0, 5			#
	syscall				# read_int()
	move	$s3, $v0		# insert_pos = read_int()
	
	li	$v0, 4			#
	la	$a0, str6		#
	syscall				# print_string("\nOriginal array: ");
	
	move	$a0, $s4		# 
	move	$a1, $s1		#
	jal	print_array		# print_array(array, array_size)
	
	move	$a0, $s4		#
	move	$a1, $s2		#
	move	$a2, $s3		#
	move	$a3, $s1		#
	jal 	insert			# insert(array, insert_value, insert_pos, array_size);
	
	
	li	$v0, 4			#
	la	$a0, str7		#
	syscall				# print_string("\nModified array: ");
	
	move	$a0, $s4		#
	addiu	$s1, $s1, 1		#
	jal	print_array		# print_array(array, array_size + 1);
	
	lw	$ra, 0($sp)		#
	addiu	$sp, $sp, 4		# Repoe a stack
	li	$v0, 0			# return 0
	jr $ra

#########################################

# Mapa de registos
# a:		$t0
# *a:		$t2
# n:		$t1
# p:		$t3
# *p:		$t4
	.data
virg:	.asciiz ", "
	.text

print_array:
	move	$t0, $a0		# Salvaguardar a num registo temporario
	move	$t1, $a1		# Salvaguardar n num registo temporario

	sll	$t1, $t1, 2		# n * 4
	addu	$t3, $t1, $t0		# p = a + n
	
for_pa:	bge	$t0, $t3, endfor_pa	# for ( a < p )

	lw	$t2, 0($t0)		# *a
	
	move	$a0, $t2		# 
	li 	$v0, 1			#
	syscall				# print_int10( *a )
	
	la	$a0, virg		#
	li	$v0, 4			#
	syscall				# print_string(", ")
	
	addiu	$t0, $t0, 4		# a++
	j for_pa
endfor_pa:
	jr $ra				#

#########################################

#Mapa de registos
# i:		$t0
# i * 4:	$t5
# array:	$a0
# value:	$a1
# pos:		$a2
# size:		$a3
# array+i:	$t1
# array[i]:	$t2
# array+pos:	$t3
# array[pos]:	$t4

insert:	

if:	ble	$a2, $a3, else		# pos > size
	li	$v0, 1			# return 1
	jr $ra

else:	
	addiu	$t0, $a3, -1		# i = size-1
	
	
for_ins: blt	$t0, $a2, endfor_ins	# i >= pos
	
	sll 	$t5, $t0, 2         	# i * 4
	addu 	$t1, $a0, $t5      	# array + i
	lw 	$t2, 0($t1)          	# array[i]

	addiu   $t5, $t5, 4         	# Endereço array[i+1]
    	addu    $t1, $a0, $t5       	# Calcula array[i+1]
    	sw      $t2, 0($t1)         	# array[i+1] = array[i]

	
	addiu	$t0, $t0, -1		# i--
	j for_ins
endfor_ins:

	sll	$a2, $a2, 2		# pos * 4
	addu	$t3, $a0, $a2		# array+pos
	sw	$a1, 0($t3)		# array[pos] = value
	
	li	$v0, 0			# return 0
	jr $ra
