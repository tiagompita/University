#include <stdio.h>

int funcao(int *p, size_t size, unsigned int *NDiv) {
    double r = p[1] / p[0];
    *NDiv = 1;

    for (size_t i = 1; i < size; i++) {
        if (p[i] / p[i-1] != r)
            return 0;
        (*NDiv)++;    
    }
    return 1;
}

int main() {
    // Arrays correspondentes às linhas de números fornecidas
    int array_1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int array_2[10] = {1, 2, 4, 4, 5, 6, 7, 8, 9, 10};
    int array_3[10] = {1, 2, 4, 8, 5, 6, 7, 8, 9, 10};
    int array_4[10] = {1, 2, 4, 8, 16, 6, 7, 8, 9, 10};
    int array_5[10] = {1, 2, 4, 8, 16, 32, 7, 8, 9, 10};
    int array_6[10] = {1, 2, 4, 8, 16, 32, 64, 8, 9, 10};
    int array_7[10] = {1, 2, 4, 8, 16, 32, 64, 128, 9, 10};
    int array_8[10] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 10};
    int array_9[10] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512};

    // Array de ponteiros para os arrays
    int* arrays[] = {array_1, array_2, array_3, array_4, array_5, array_6, array_7, array_8, array_9};

    for (int i = 0; i < 9; i++) {
        int sucess;
        unsigned int NDiv=0;

        sucess = funcao(arrays[i], 10, &NDiv);
        printf("O array_%d fez %u divisoes e ", i+1, NDiv);

        if(sucess)
            printf("e' uma sequencia geometrica\n");
        else
            printf("nao e' uma sequencia geometrica\n");
    }    

    return 0;
}