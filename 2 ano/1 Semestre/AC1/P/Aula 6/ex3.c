#include <stdio.h>

#define SIZE 3

void print_string(const char *str) {
    printf("%s", str);
}

void print_int10(int num) {
    printf("%d", num);
}

void print_char(char c) {
    putchar(c);
}

void main(void) {
    static char *array[SIZE] = {"Array", "de", "ponteiros"};
    int i, j;
    for (i = 0; i < SIZE; i++) {
        print_string("\nString #");
        print_int10(i);
        print_string(": ");
        j = 0;
        while (array[i][j] != '\0') {
            print_char(array[i][j]);
            print_char('-');
            j++;
        }
    }
}