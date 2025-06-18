#include <stdio.h>

#define SIZE 4
int array[SIZE] = {7692, 23, 5, 234}; // Declara um array global de 4 posições e inicializa-o

void print_int10(int num) {
    printf("Soma: %d\n", num);
}

void main(void) {
    int soma = 0;
    
    for (int i = 0; i < SIZE; i++) {
        soma += array[i]; // Acessa o array usando índices
    }
    
    print_int10(soma);
}