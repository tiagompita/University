	.data
	.align 2
str1:	.asciiz "St1"
	.space 10
	.double
	.text
	.globl main
	
main:

	li	$v0, 0			# return 0
	jr	$ra			