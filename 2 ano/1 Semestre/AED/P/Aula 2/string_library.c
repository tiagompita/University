#include <stdio.h>
#include <string.h>

void to_minus(char *s) {
    if ( s == NULL) 
        return;
    
    while (*s != '\0') {
        if (*s >= 'A' && *s <='Z') {
            *s = *s + 'a'-'A';
        }
        s++;
    }
}

int main(void)
{
    char str1[256];
    char str2[256];

    //String 1
    printf("String 1: ");
    scanf("%[^\n]", str1);
    getchar();

    //String 2
    printf("String 2: ");
    scanf("%[^\n]", str2);

    //Print Strings
    printf("String 1: %s & String 2: %s\n", str1, str2);

    //Contar o carateres da String 1
    printf("String 1 Length: %zu\n", strlen(str1));

    //Contar as letras Maiusculas na String 2
    int upper = 0;
    for (int i=0; str2[i]!='\0'; i++) {
        if (str2[i]>='A' && str2[i]<='Z') {
            upper++;
        }
    }
    printf("Numero de Letras Maiusculas na String 2: %d\n", upper);

    //Converter as letras Maiusculas para minusculas
    to_minus(str1);
    to_minus(str2);

    // Print Strings
    printf("String 1: %s & String 2: %s\n", str1, str2);

    return 0;
}
