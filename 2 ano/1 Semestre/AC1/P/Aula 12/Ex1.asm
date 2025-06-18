	.data
	.eqv MAX_STUDENTS, 4
	.align 2
st_array: .space 176
media:	.space 4
msg:	.asciiz "\nMedia: "
	.text
	.globl main
	
main:	addiu	$sp, $sp, -4			#
	sw	$ra, 0($sp)			#
	
	la	$a0, st_array			#
	li	$a1, MAX_STUDENTS		#
	jal 	read_data		
	
	la	$a0, st_array			#
	li	$a1, MAX_STUDENTS		#
	la	$t0, media			#
	l.s	$f12, 0($t0)			#
	jal 	max			
	
	la	$a0, msg			#
	li	$v0, 4				#
	syscall					# print_string("\nMedia: ");
	
	
	lw	$ra, 0($sp)			#
	addiu	$sp, $sp, 4			#
	
	jr	$ra
	
#################################################

# Mapa de registos
#
# *st = $t1
# ns = $t2
# i = $t0
	.data
k1:	.asciiz "N. Mec: "
k2:	.asciiz "P. Nome: "
k3:	.asciiz "U. Nome: "
k4:	.asciiz "Nota: "

read_data:
	addiu	$sp, $sp, -4			#
	sw	$ra, 0($sp)			#

	move	$t1, $a0
	move	$t2, $a1
	li	$t0, 0				# i = 0
	
for:	bge	$t0, $t2, endfor		# while ( i < ns ) {

	la	$a0, k1				#
	li 	$v0, 4				#
	syscall					# print_string("N. Mec: ");
	
	mul 	$t3, $t0, 44			# i * 44
	add	$t4, $t1, $t3			# &st[i]
	
	li	$v0, 5				#
	syscall					# read_int()
	
	sw	$v0, 0($t4)			# st[i].id_number = read_int()
	
	la	$a0, k2				#
	li 	$v0, 4				#
	syscall					# print_string("P. Nome: ");
	
	lw	$a0, 4($t4)			# st[i].first_name
	li	$a1, 17
	li	$v0, 8				
	syscall					# read_string(st[i].first_name, 17)
	
	la	$a0, k3				#
	li 	$v0, 4				#
	syscall					# print_string("U. Nome: ");
	
	lw	$a0, 24($t4)			# st[i].last_name
	li	$a1, 14
	li	$v0, 8				
	syscall					# read_string(st[i].last_name, 14)
	
	la	$a0, k4				#
	li 	$v0, 4				#
	syscall					# print_string("Nota: ")
	
	li	$v0, 6				#
	syscall					# read_float()
	
	s.s	$f0, 40($t4)			# st[i].id_number = read_float()

	addiu	$t0, $t0, 1			# i++
	j for
endfor:

	lw	$ra, 0($sp)			#
	addiu	$sp, $sp, 4			#

	jr	$ra
	
#################################################

# Mapa de registos
#
# *st = $a0
# ns = 	$a1
# *media = $f12
#
# p = $t0
# pmax = $t1
# max_grade = $f2
# sum = $f4

	.data
max_grade: .float -20.0
sum:	.float 0.0
	.text
	
max:	addiu	$sp, $sp, -4			#
	sw	$ra, 0($sp)			#
	
	move	$t0, $a0			# p = st
for2:	add	$t2, $a0, $a1			# st + ns 	Provavelmente errado
	bge	$t0, $t2, endfor2		# while ( p < (st + ns) )	

	l.s	$f6, 40($t0)			# p -> grade
	add.s	$f4, $f4, $f6			# sum += p -> grade

	la	$t3, max_grade			#
	l.s	$f2, 0($t3)			#
	
if:	c.le.s	$f6, $f2			# if(p->grade > max_grade)
	bc1t	endif				#
	mov.s	$f2, $f6			# max_grade = p->grade;
	move	$t1, $t0			# pmax = p
endif:
	addi	$t0, $t0, 44			# p++
	j for2
endfor2:
	mtc1 	$a1, $f8			#
	cvt.s.w	$f8, $f8			# (float)ns
	
	div.s	$f12, $f4, $f8			# *media = sum / (float)ns
	
	move	$v0, $t1			# return pmax
	
	lw	$ra, 0($sp)			#
	addiu	$sp, $sp, 4			#
	
	jr $ra
	
#################################################

# Mapa de registos
#
# *p = $t0

print_student:
	move	$t0, $a0

	lw	$a0, 0($t0)			# p->id_number
	li	$v0, 1				#
	syscall					# print_intu10(p->id_number);
	
	addi	$a0, $t0, 4			# p->first_name
	li	$v0, 4				#
	syscall					# print_string(p->first_name);
	
	addi	$a0, $t0, 24			# p->last_name
	li	$v0, 4				#
	syscall					# print_string(p->last_name);
	
	l.s	$f12, 40($t0)			# p->grade
	li	$v0, 2				#
	syscall					# print_float(p->grade);
	
	jr	$ra