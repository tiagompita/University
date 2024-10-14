#include <stdio.h>

int funcao(double *p, size_t size, unsigned int *NDiv)
{
    if (p[0] == 0) // Verificação de divisão por zero
        return 0;

    double r = p[1] / p[0]; // Razão da progressão geométrica
    *NDiv = 1;              // Primeira divisão para calcular r

    for (size_t i = 1; i < size; i++)
    {
        if (p[i - 1] == 0 || p[i] / p[i - 1] != r) // Divisões nas iterações
            return 0;
        (*NDiv)++; // Contar divisões
    }
    return 1;
}

int main()
{
    // Arrays com valores reais (doubles)
    double array_1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    double array_2[10] = {1, 2, 4, 4, 5, 6, 7, 8, 9, 10};
    double array_3[10] = {1, 2, 4, 8, 5, 6, 7, 8, 9, 10};
    double array_4[10] = {1, 2, 4, 8, 16, 6, 7, 8, 9, 10};
    double array_5[10] = {1, 2, 4, 8, 16, 32, 7, 8, 9, 10};
    double array_6[10] = {1, 2, 4, 8, 16, 32, 64, 8, 9, 10};
    double array_7[10] = {1, 2, 4, 8, 16, 32, 64, 128, 9, 10};
    double array_8[10] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 10};
    double array_9[10] = {1, 2, 4, 8, 16, 32, 64, 128, 256, 512};

    // Array de ponteiros para os arrays
    double *arrays[] = {array_1, array_2, array_3, array_4, array_5, array_6, array_7, array_8, array_9};

    for (int i = 0; i < 9; i++)
    {
        int sucess;
        unsigned int NDiv = 0;

        sucess = funcao(arrays[i], 10, &NDiv);
        printf("O array_%d fez %u divisoes e ", i + 1, NDiv);

        if (sucess)
            printf("é uma sequência geométrica\n");
        else
            printf("não é uma sequência geométrica\n");
    }

    return 0;
}
