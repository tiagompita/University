    .equ READ_CORE_TIMER, 11       # Código do system call readCoreTimer()
    .equ RESET_CORE_TIMER, 12      # Código do system call resetCoreTimer()
    .equ K, 20000                  # Constante para conversão de ms

    .data
    .text
    .globl main

main:
    # Reserva espaço na pilha para 7 words
    addi    $sp, $sp, -28
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)       # cnt1
    sw      $s1, 8($sp)       # cnt5
    sw      $s2, 12($sp)      # cnt10
    sw      $s3, 16($sp)      # tick
    sw      $s4, 20($sp)      # delay (em ms)
    sw      $s5, 24($sp)      # flag de pausa

    # Inicializa os contadores e variáveis:
    li      $s0, 0           # cnt1 = 0
    li      $s1, 0           # cnt5 = 0
    li      $s2, 0           # cnt10 = 0
    li      $s3, 0           # tick = 0
    li      $s4, 100         # modo normal: delay = 100 ms
    li      $s5, 0           # não pausado (0 = funcionando)

loop:
    # ----- Leitura do caracter (não bloqueante) via inkey() -----
    li      $v0, 1           # system call inkey()
    syscall
    move    $t1, $v0         # $t1 guarda o caracter lido

    # ----- Verificação das teclas para ajuste de frequência e pausa/retoma -----
    li      $t2, 'A'
    beq     $t1, $t2, set_double   # se for 'A', dobra a frequência (delay = 50 ms)
    li      $t2, 'N'
    beq     $t1, $t2, set_normal   # se for 'N', modo normal (delay = 100 ms)
    li      $t2, 'S'
    beq     $t1, $t2, set_pause    # se for 'S', suspende a contagem
    li      $t2, 'R'
    beq     $t1, $t2, set_resume   # se for 'R', retoma a contagem
    # Se nenhum desses, continua sem alteração
    j continue_delay

set_double:
    li      $s4, 50          # delay = 50 ms (dobro de frequência)
    j       continue_delay

set_normal:
    li      $s4, 100         # delay = 100 ms (frequência normal)
    j       continue_delay

set_pause:
    li      $s5, 1           # seta flag de pausa (1 = contagem suspensa)
    j       continue_delay

set_resume:
    li      $s5, 0           # limpa flag de pausa (retoma contagem)
    j       continue_delay

continue_delay:
    # ----- Chama a função delay() com o valor corrente (em $s4) -----
    move    $a0, $s4         # delay em ms (100 ou 50)
    jal     delay

    # ----- Atualiza os contadores somente se não estiver pausado -----
    beq     $s5, $zero, update_counters
    j       print_loop      # se pausado ($s5 != 0), não atualiza e vai para impressão

update_counters:
    addi    $s3, $s3, 1      # tick++
    addi    $s2, $s2, 1      # cnt10 incrementa a cada iteração (10Hz ou 20Hz)

    # Incrementa cnt5 a cada tick múltiplo de 2
    rem     $t0, $s3, 2
    beq     $t0, $zero, inc_cnt5
    j       skip_cnt5
inc_cnt5:
    addi    $s1, $s1, 1
skip_cnt5:
    # Incrementa cnt1 a cada tick múltiplo de 10
    rem     $t0, $s3, 10
    beq     $t0, $zero, inc_cnt1
    j       skip_cnt1
inc_cnt1:
    addi    $s0, $s0, 1
skip_cnt1:

print_loop:
    # ----- Impressão dos contadores na mesma linha -----
    # Imprime o caractere de retorno de carro ('\r') para sobrescrever a linha anterior
    li      $a0, '\r'
    li      $v0, 3           # system call putChar()
    syscall

    # Imprime cnt1 em base 10 com 5 dígitos: formato = 10 | (5 << 16)
    move    $a0, $s0
    li      $t0, 5
    sll     $t0, $t0, 16
    ori     $a1, $t0, 10
    li      $v0, 6           # system call printInt()
    syscall

    # Imprime um caractere de tabulação
    li      $a0, '\t'
    li      $v0, 3
    syscall

    # Imprime cnt5 em base 10 com 5 dígitos
    move    $a0, $s1
    li      $t0, 5
    sll     $t0, $t0, 16
    ori     $a1, $t0, 10
    li      $v0, 6
    syscall

    # Imprime um caractere de tabulação
    li      $a0, '\t'
    li      $v0, 3
    syscall

    # Imprime cnt10 em base 10 com 5 dígitos
    move    $a0, $s2
    li      $t0, 5
    sll     $t0, $t0, 16
    ori     $a1, $t0, 10
    li      $v0, 6
    syscall

    # Imprime um caractere de tabulação (opcional)
    li      $a0, '\t'
    li      $v0, 3
    syscall

    j       loop

    # ----- Restauração dos registradores e término (nunca alcançado) -----
    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    lw      $s2, 12($sp)
    lw      $s3, 16($sp)
    lw      $s4, 20($sp)
    lw      $s5, 24($sp)
    addi    $sp, $sp, 28
    li      $v0, 0
    jr      $ra

#################################################
# Função delay: espera aproximadamente (ms) milissegundos
# $a0: tempo de delay em ms
delay:
    li      $v0, RESET_CORE_TIMER
    syscall

delay_loop:
    li      $v0, READ_CORE_TIMER
    syscall
    li      $t0, K
    mul     $t0, $t0, $a0    # Calcula K * ms
    blt     $v0, $t0, delay_loop
    jr      $ra
