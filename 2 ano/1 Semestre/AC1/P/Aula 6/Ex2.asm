# p : 		$t1
# ultimo: 	$t2

	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	.data
array:	.word str1,str2,str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz	"Ponteiros"
	.text
	.globl main
main:
	la 	$t1, array		# p = array
	
	li 	$t0, SIZE 		#
	sll 	$t0,$t0,2 		# SIZE * 4
	addu 	$t2, $t1, $t0 		# $t2 = ultimo = array + SIZE
	
while: 	bge	$t1, $t2, endw

	lw 	$a0, 0($t1) 		# $a0 = array[i]
	
	li	$v0, print_string	#
	syscall				# print_string(array[i]);
	
	li	$v0, print_char		#
	li	$a0, '\n'		#
	syscall				# print_char('\n')
	
	addi	$t1, $t1, 4		# p++
	
	j while
endw:
	jr $ra