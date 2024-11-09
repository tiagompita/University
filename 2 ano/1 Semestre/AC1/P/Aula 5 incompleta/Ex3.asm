# Mapa de registos
# houveTroca: $t0
# i: $t1
# aux: $t2
# p: $t3
# lista[i]: $t4
# lista[i+1]: $t5

	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
str:    .asciiz "\nIntroduza 10 numeros:\n"
str1:   .asciiz "\nConteudo do array ordenado\n"
str2:   .asciiz "; "
	.align 2    # 2^2 = 4
lista:  .space 40    # SIZE * 4

	.text
	.globl main

main:
    # Print the prompt for input
    li  $v0, print_string
    la  $a0, str
    syscall                 # print_string("\nIntroduza 10 numeros:\n")
    
    # Read values into the array
    la  $t3, lista          # p = lista
    li  $t4, SIZE           # $t4 = SIZE
    li  $t1, 0              # i = 0
    
read_loop:
    bge  $t1, SIZE, sort    # for (i = 0; i < SIZE; i++) {
    
    li  $v0, read_int
    syscall                 # $v0 = read_int()
    
    sw  $v0, 0($t3)         # lista[i] = read_int()
    addiu $t3, $t3, 4       # p++
    addiu $t1, $t1, 1       # i++
    j read_loop             # }
    
sort:
    # Bubble sort
    li	$t6, SIZE
    addi $t6, $t6, -1
do:
    li  $t0, FALSE          # houveTroca = FALSE
    li  $t1, 0              # i = 0
    
for:
    bge  $t1, $t6, endfor # for (i = 0; i < SIZE-1; i++) {
    
    sll $t7, $t1, 2         # $t7 = i * 4
    la  $t3, lista          # $t3 = lista
    addu $t7, $t3, $t7      # $t7 = &lista[i]
    
    lw  $t4, 0($t7)         # $t4 = lista[i]
    lw  $t5, 4($t7)         # $t5 = lista[i+1]
    
    ble $t4, $t5, endif     # if (lista[i] <= lista[i+1]) continue
    
    move $t2, $t4           # aux = lista[i]
    sw  $t5, 0($t7)         # lista[i] = lista[i+1]
    sw  $t2, 4($t7)         # lista[i+1] = aux
    li  $t0, TRUE           # houveTroca = TRUE
    
endif:
    addi $t1, $t1, 1        # i++
    j for                   # }
endfor:
    bne  $t0, TRUE, do      # } while (houveTroca == TRUE)
    
    # Print the sorted array
    li  $v0, print_string
    la  $a0, str1
    syscall                 # print_string("\nConteudo do array ordenado:\n")
    
    li  $t1, 0              # i = 0
    la  $t3, lista          # p = lista
    
print_loop:
    bge  $t1, SIZE, endprint # for (i = 0; i < SIZE; i++) {
    
    lw  $t4, 0($t3)         # $t4 = lista[i]
    
    li  $v0, print_int10
    move $a0, $t4
    syscall                 # print_int10(lista[i])
    
    li  $v0, print_string
    la  $a0, str2
    syscall                 # print_string("; ")
    
    addiu $t3, $t3, 4       # p++
    addiu $t1, $t1, 1       # i++
    j print_loop            # }
endprint:
    jr $ra                  # fim do programa