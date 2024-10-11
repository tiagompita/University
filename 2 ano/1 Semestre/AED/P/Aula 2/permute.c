#include <stdio.h>

// Function to perform circular permutation of three integers
void Permute(int *a, int *b, int *c) {
    int temp = *a; // Armazena o valor apontado por a
    *a = *b;      // Copia o valor apontado por b para o local apontado por a
    *b = *c;      // Copia o valor apontado por c para o local apontado por b
    *c = temp;    // Copia o valor armazenado em temp para o local apontado por c
}

int main() {
    int x = 1, y = 2, z = 3;

    // Print values before permutation
    printf("Before permutation: x = %d, y = %d, z = %d\n", x, y, z);

    // Perform permutation
    Permute(&x, &y, &z); // Passa os endereços das variáveis x, y e z

    // Print values after permutation
    printf("After permutation: x = %d, y = %d, z = %d\n", x, y, z);

    return 0;
}