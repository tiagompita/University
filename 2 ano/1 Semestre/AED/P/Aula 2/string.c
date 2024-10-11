#include <stdio.h>
#include <string.h>

void to_minus(char *s) {
    if (s == NULL) 
        return;
    
    while (*s != '\0') {
        if (*s >= 'A' && *s <= 'Z') {
            *s = *s + 'a' - 'A';
        }
        s++;
    }
}

void upperLetters(char *s) {
    int upper = 0;
    for (int i = 0; s[i] != '\0'; i++) {
        if (s[i] >= 'A' && s[i] <= 'Z') {
            upper++;
        }
    }
    printf("Numero de Letras Maiusculas na String 2: %d\n", upper);
}

int ABC_Counter(char *s) {
    int c = 0; 
    for (int i = 0; s[i] != '\0'; i++) {
        if ((s[i] >= 'A' && s[i] <= 'Z') || (s[i] >= 'a' && s[i] <= 'z')) {
            c++;
        }
    }
    return c;
}

void compareString(char *s1, char *s2) {
    int res = strcmp(s1, s2);

    if (res == 0) {
        printf("Strings are equal\n");
    } else {
        printf("Strings are unequal\n");
        if (res < 0) {
            printf("Lexicographic order: %s, %s\n", s1, s2);
        } else {
            printf("Lexicographic order: %s, %s\n", s2, s1);
        }
    }
}

int main(void) {
    char str1[256];
    char str2[256];

    // String 1
    printf("String 1: ");
    scanf("%[^\n]", str1);
    getchar();

    // String 2
    printf("String 2: ");
    scanf("%[^\n]", str2);

    // Print Strings
    printf("String 1: %s & String 2: %s\n", str1, str2);

    printf("\n");
    // Contar os caracteres da String 1
    printf("String 1 ABC Char Length: %d\n", ABC_Counter(str1));

    printf("\n");
    // Contar as letras maiúsculas na String 2
    upperLetters(str2);

    printf("\n");
    // Comparar as duas strings originais
    compareString(str1, str2);

    printf("\n");
    // Converter as letras maiúsculas para minúsculas
    to_minus(str1);
    to_minus(str2);
    // Print Strings convertidas
    printf("String 1: %s & String 2: %s\n", str1, str2);

    printf("\n");
    char str2_copy[sizeof(str2)];
    strcpy(str2_copy, str2);

    char concatenate[256];
    strcpy(concatenate, str2_copy);
    strcat(concatenate, str2);
    printf("Concatenacao da str2 com a sua copia: %s\n", concatenate);

    return 0;
}