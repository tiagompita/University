#include <stdio.h>
#include <stdlib.h>

unsigned int ncomps;

int funcao(int *p, size_t size, unsigned int *ncomps)
{
    *ncomps = 0;
    unsigned int nternos = 0;

    for (unsigned int k = 2; k < size; k++)
    {
        for (unsigned int j = 1; j < k; j++)
        {
            for (unsigned int i = 0; i < j; i++)
            {
                (*ncomps)++; // Contar a comparação antes da verificação
                if (p[k] == p[i] + p[j])
                {
                    nternos++;
                }
            }
        }
    }
    return nternos;
}

int main(void)
{
    // Definindo as sequências
    int array_1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int array_2[10] = {1, 2, 1, 4, 5, 6, 7, 8, 9, 10};
    int array_3[10] = {1, 2, 1, 3, 2, 6, 7, 8, 9, 10};
    int array_4[10] = {0, 2, 2, 0, 3, 3, 0, 4, 4, 0};
    int array_5[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    // Novas sequências
    int array_6[5] = {1, 1, 2, 3, 5};                                                                                                                       
    int array_7[20] = {1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9};                                                                    
    int array_8[30] = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};                          
    int array_9[40] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181};

    // Array de ponteiros para as sequências e seus tamanhos
    int *arrays[] = {array_1, array_2, array_3, array_4, array_5, array_6, array_7, array_8, array_9};
    size_t sizes[] = {10, 10, 10, 10, 10, 5, 20, 30, 40};

    // Loop sobre as sequências
    for (int i = 0; i < 9; i++)
    {
        unsigned int ncomps = 0;                      // Inicializar ncomps para cada chamada
        int nternos = funcao(arrays[i], sizes[i], &ncomps); // Passar o tamanho correto da array
        printf("Array %d: nternos = %d, ncomps = %u\n", i + 1, nternos, ncomps);
    }

    return 0;
}