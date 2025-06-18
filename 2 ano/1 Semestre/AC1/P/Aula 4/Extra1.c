#include <stdio.h>

#define SIZE 20

void print_string(const char *str) {
    printf("%s", str);
}

void read_string(char *str, int size) {
    fgets(str, size + 1, stdin);
    // Remove newline character if present
    char *newline = strchr(str, '\n');
    if (newline) {
        *newline = '\0';
    }
}

void main(void) {
    static char str[SIZE + 1];
    char *p;
    print_string("Introduza uma string: ");
    read_string(str, SIZE);
    p = str;
    while (*p != '\0') {
        if (*p >= 'a' && *p <= 'z') {
            *p = *p - 'a' + 'A'; // 'a'=0x61, 'A'=0x41, 'a'-'A'=0x20
        }
        p++;
    }
    print_string(str);
}