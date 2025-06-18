#include <stdio.h>
#include <string.h>

#define SIZE 20

void read_string(char *str, int size) {
    printf("Enter a string: ");
    fgets(str, size + 1, stdin);
    // Remove newline character if present
    str[strcspn(str, "\n")] = '\0';
}

void print_int10(int num) {
    printf("Number of digits: %d\n", num);
}

void main(void) {
    static char str[SIZE + 1]; // Reserva espaço para um array de "SIZE+1" bytes no segmento de dados ("SIZE" carateres + terminador)
    int num, i;
    read_string(str, SIZE); // "str" é o endereço inicial do espaço reservado para alojar a string (na memória externa)
    num = 0;
    i = 0;
    while (str[i] != '\0') { // Acede ao carater (byte) na posição "i" do array e compara-o com o carater terminador (i.e. '\0' = 0x00)
        if ((str[i] >= '0') && (str[i] <= '9'))
            num++;
        i++;
    }
    print_int10(num);
}