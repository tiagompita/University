#include <stdio.h>
#include <stdlib.h>

int NCOMPS = 0;

int funcao(int *p, size_t size)
{
    int n = 0;

    for (size_t i = 1; i < size - 1; i++)
    {
        NCOMPS++; // Incrementar número de comparações
        if (p[i] == p[i - 1] + p[i + 1])
        {
            n++;
        }
    }
    return n;
}

int main()
{
    // Testar com arrays de tamanhos diferentes
    for (int n = 10; n <= 100000; n *= 10)
    {               // Testar tamanhos 10, 100, 1000, etc.
        NCOMPS = 0; // Resetar o contador de comparações
        int *array = (int *)malloc(n * sizeof(int));

        // Preencher array com números aleatórios ou padrões que preferir
        for (int i = 0; i < n; i++)
        {
            array[i] = i;
        }

        int result = funcao(array, n);
        printf("Para n = %d, Comparacoes bem sucedidas: %d, Numero total de comparacoes: %d\n", n, result, NCOMPS);
        free(array); // Liberar memória alocada
    }
    return 0;
}
