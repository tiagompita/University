#include <stdio.h>

#define SIZE 8

void print_string(const char* str) {
    printf("%s", str);
}

void print_int10(int val) {
    printf("%d", val);
}

void print_char(char c) {
    putchar(c);
}

void main(void) {
    static int val[SIZE] = {8, 4, 15, 1987, 327, -9, 27, 16};
    int i, v;

    i = 0;
    do {
        v = val[i];
        val[i] = val[i + SIZE / 2];
        val[i + SIZE / 2] = v;
    } while (++i < (SIZE / 2));

    print_string("Result is: ");
    i = 0;
    do {
        print_int10(val[i++]);
        print_char(',');
    } while (i < SIZE);
}