# Mapa de registos
# i: $t0
# argc: $a0
# argv: $a1

	.data
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
str:    .asciiz "Nr. de parametros: "
str1:   .asciiz "\nP"
str2:   .asciiz ": "
	.text
	.globl main

main:	move	$t9, $a0	# temp = $a0

    	li  $v0, print_string	#
    	la  $a0, str		#
    	syscall                 # print_string("Nr. de parametros: ")
    
    	li  $v0, print_int10
    	move $a0, $t9           # argc
    	syscall                 # print_int10(argc)
    
    	li  $t0, 0              # i = 0
    
for:	bge $t0, $t9, endfor    # for (i = 0; i < argc; i++) {
    
    	li  $v0, print_string	#
    	la  $a0, str1		#
    	syscall                 # print_string("\nP")
    
    	li  $v0, print_int10	#
    	move $a0, $t0		#
    	syscall                 # print_int10(i)
    
    	li  $v0, print_string	#
    	la  $a0, str2		#
    	syscall                 # print_string(": ")
    
    	sll $t1, $t0, 2         # i * 4
    	addu $t2, $a1, $t1      # $t2 = &argv[i]
    	lw  $a0, 0($t2)         # $a0 = argv[i]
    
    	li  $v0, print_string	#
    	syscall                 # print_string(argv[i])
    
    	addi $t0, $t0, 1        # i++
    	j for                   # }
    
endfor:
    	
    	jr $ra
