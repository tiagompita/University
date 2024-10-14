#include <stdio.h>

int NCOMPS = 0;

int funcao (int *p, size_t size) {
    int n = 0;

    for (size_t i = 1; i < size -1; i++) {
        NCOMPS++;

        if (p[i] == p[i-1] + p[i+1]) {
            n++;
        }
    }
    return n;
}

int main()
{
    int array_1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int array_2[10] = {1, 2, 1, 4, 5, 6, 7, 8, 9, 10};
    int array_3[10] = {1, 2, 1, 3, 2, 6, 7, 8, 9, 10};
    int array_4[10] = {0, 2, 2, 0, 3, 3, 0, 4, 4, 0};
    int array_5[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    printf("Numero total de comparacoes: %d\nComparacoes bem sucedidas: %d\n", NCOMPS, funcao(array_5, 10));

    return 0;
}
