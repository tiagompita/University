#include <stdio.h>
#define SIZE 10
#define FALSE 0
#define TRUE 1

void main(void)
{
    static int lista[SIZE];
    int houveTroca, aux;
    int *p, *pUltimo;
    int *ultimoOrdenado;

    // Inserir valores no array
    printf("Introduza 10 números:\n");
    for (int i = 0; i < SIZE; i++)
        scanf("%d", &lista[i]);

    // Algoritmo otimizado
    ultimoOrdenado = lista + (SIZE - 1); // Aponta para o último elemento do array
    do
    {
        houveTroca = FALSE;
        pUltimo = ultimoOrdenado; // Limita a iteração ao último elemento não ordenado
        for (p = lista; p < pUltimo; p++)
        {
            if (*p > *(p + 1))
            {
                aux = *p;
                *p = *(p + 1);
                *(p + 1) = aux;
                houveTroca = TRUE;
                ultimoOrdenado = p; // Atualiza o índice do último elemento trocado
            }
        }
    } while (houveTroca == TRUE);

    // Imprimir conteúdo ordenado
    printf("\nConteúdo do array ordenado:\n");
    for (int i = 0; i < SIZE; i++)
        printf("%d; ", lista[i]);
}
