#include <stdio.h>
#include <locale.h>

int main(void) {
    // Configurar a localidade para Português
    setlocale(LC_ALL, "Portuguese");

    int cubes[10];
    int count = 0;

    // Pré-computar os cubos dos dígitos de 0 a 9
    for (int i = 0; i < 10; i++) {
        cubes[i] = i * i * i;
    }

    printf("Números de Armstrong de 3 algarismos:\n");

    // Iterar sobre todos os números de 3 dígitos
    for (int num = 100; num < 1000; num++) {
        int sum = 0;
        int temp = num;

        // Calcular a soma dos cubos dos dígitos
        while (temp > 0) {
            int digit = temp % 10;
            sum += cubes[digit];
            temp /= 10;
            count++; // Incrementar a contagem de operações
        }

        // Verificar se a soma é igual ao número original
        if (sum == num) {
            printf("%d\n", num);
        }
    }

    printf("Número de operações de soma realizadas: %d\n", count);

    return 0;
}