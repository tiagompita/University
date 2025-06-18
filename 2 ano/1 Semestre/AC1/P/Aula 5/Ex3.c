#include <stdio.h>

#define SIZE 10
#define TRUE 1
#define FALSE 0

void print_string(const char* str) {
    printf("%s", str);
}

int read_int() {
    int value;
    scanf("%d", &value);
    return value;
}

void print_int10(int value) {
    printf("%d", value);
}

void main(void) {
    static int lista[SIZE];
    int houveTroca, i, aux;
    int *p;

    // Leitura de valores e preenchimento do array usando acesso por ponteiro
    print_string("\nIntroduza 10 numeros:\n");
    for (p = lista; p < lista + SIZE; p++) {
        *p = read_int();
    }

    // Ordenação do array usando o algoritmo de bubble sort
    do {
        houveTroca = FALSE;
        for (i = 0; i < SIZE - 1; i++) {
            if (lista[i] > lista[i + 1]) {
                aux = lista[i];
                lista[i] = lista[i + 1];
                lista[i + 1] = aux;
                houveTroca = TRUE;
            }
        }
    } while (houveTroca == TRUE);

    // Impressão do conteúdo do array usando acesso indexado
    print_string("\nConteudo do array ordenado:\n");
    for (i = 0; i < SIZE; i++) {
        print_int10(lista[i]);
        print_string("; ");
    }
}