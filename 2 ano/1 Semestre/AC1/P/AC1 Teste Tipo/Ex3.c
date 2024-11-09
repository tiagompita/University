#include <stdio.h>

#define N 35

int read_int() {
    int value;
    scanf("%d", &value);
    return value;
}

void print_int10(int val) {
    printf("%d\n", val);
}

void main(void) {
    static int a[N], b[N];
    int n_even = 0;
    int n_odd = 0;
    int *p1, *p2;

    // Lê N inteiros e armazena no array a
    for (p1 = a; p1 < (a + N); p1++) {
        *p1 = read_int();
    }

    // Separa os números ímpares no array b e conta os pares e ímpares
    for (p1 = a, p2 = b; p1 < (a + N); p1++) {
        if ((*p1 % 2) != 0) {
            *p2++ = *p1;
            n_odd++;
        } else {
            n_even++;
        }
    }

    // Imprime os números ímpares armazenados no array b
    for (p2 = b; p2 < (b + n_odd); p2++) {
        print_int10(*p2);
    }
}