    .data
    .equ ADDR_BASE_HI,0xBF88    # Base address: 16 MSbits 
    .equ TRISE,0x6100           # TRISE address is 0xBF886100 
    .equ PORTE,0x6110           # PORTE address is 0xBF886110 
    .equ LATE,0x6120            # LATE  address is 0xBF886120

    .equ readCoreTimer, 11
    .equ resetCoreTimer, 12
    .text
    .globl main

main:

    lui     $t0, ADDR_BASE_HI       #

    lw      $t2, TRISE($t0)         # READ
    andi    $t2, $t2, 0xFFB0        # MODIFY
    sw      $t2, TRISE($t0)         #

    lw      $t3, LATE($t0)
    andi    $t3, $t3, 0xFFB0
    sw      $t3, LATE($t0)

    li      $t2, 0x0001             # 0001 (primeiro elemento da sequencia)

loop:                               # while(1)            

    lw      $t3, LATE($t0)
    andi    $t3, $t3, 0xFF40        # Limpa RE3 a RE0 e RE6
    or      $t3, $t2, $t3           # Coloca o elemento da sequencia nos LEDs RE3 a RE0
    xori    $t3, $t3, 0x0040        # Alterna o LED RE6
    sw      $t3, LATE($t0)

    # Imprime o valor da sequência em binário
    li      $t4, 5                  # Número de bits (5 bits)
    li      $t5, 0x10               # Máscara inicial (10000 em binário)

print_loop:
    and     $t6, $t2, $t5           # Isola o bit mais significativo
    beqz    $t6, print_zero         # Se o bit for 0, imprime '0'
    li      $a0, '1'                # Caso contrário, imprime '1'
    j       print_char

print_zero:
    li      $a0, '0'                # Imprime '0'

print_char:
    li      $v0, 3                 # Syscall para imprimir caractere
    syscall

    srl     $t5, $t5, 1             # Desloca a máscara para o próximo bit
    sub     $t4, $t4, 1             # Decrementa o contador de bits
    bgtz    $t4, print_loop         # Continua enquanto houver bits a imprimir

    # Imprime nova linha
    li      $a0, '\n'
    li      $v0, 3
    syscall

    # Atualiza a sequência
    sll     $t2, $t2, 1             # Passa de 0001 para 0010
    andi    $t2, $t2, 0x000F        # Garante que $t2 fica dentro de 4 bits
if: bne     $t2, 0x0000, endif      # Reseta a sequência se ultrapassar 1000
    li      $t2, 0x0001
endif:

    li      $v0, resetCoreTimer
    syscall

wait:
    li      $v0, readCoreTimer
    syscall
    blt     $v0, 8695652, wait      # f = 2.3Hz

    j loop

    jr  $ra
