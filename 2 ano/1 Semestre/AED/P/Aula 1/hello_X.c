#include <stdio.h>

int main(void)
{
    char apelido[10],name[10];
    int lixo = 123;

    printf("Nome? ");
    //gets(name);
    //fgets(name, sizeof(name), stdin);

    scanf("%9[^\n]s", name);
    getchar(); //Necessario para proximos scans.

    printf("Apelido? ");
    scanf("%9[^\n]s", apelido);

    printf("Hello %s %s", name, apelido);

    return 0;
}