# Mapa de registos
#
#   state = $t0
#   cnt =   $t1
#   c =     $t2

    .equ UP, 1
    .equ DOWN, 0
    
    .data
    .text
    .globl main

main:
    li      $t0, 0          $
    li      $t1, 0