#include <stdio.h>

unsigned int ncomps;

int funcao(int *p, size_t size, unsigned int *ncomps) {
    *ncomps = 0;
    int nternos = 0;

    for (unsigned int k = 2; k < size; k++) {
        for (unsigned int j = 1; j < k; j++) {
            for (unsigned int i = 0; i < j; i++) {
                
                if (p[k] == p[i] + p[j]) 
                    nternos += 1;

                (*ncomps)++;    

            }
        }
    }
    return nternos;
}

int main(void) {
    int array_1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int array_2[10] = {1, 2, 1, 4, 5, 6, 7, 8, 9, 10};
    int array_3[10] = {1, 2, 1, 3, 2, 6, 7, 8, 9, 10};
    int array_4[10] = {0, 2, 2, 0, 3, 3, 0, 4, 4, 0};
    int array_5[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    int* arrays[] = {array_1, array_2, array_3, array_4, array_5};

    for (int i = 0; i < 5; i++) {
        int nternos = funcao(arrays[i], 10, &ncomps);
        printf("Array %d: nternos = %d, ncomps = %u\n", i + 1, nternos, ncomps);
    }

    return 0;
}