#include <stdio.h>

int main(void)
{
    char name[10];
    int lixo = 123;

    printf("Nome? ");
    //gets(name);
    //fgets(name, sizeof(name), stdin);

    scanf("%9[^\n]s", name);

    printf("Hello %s  %d", name,lixo);

    return 0;
}