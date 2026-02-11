#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(void)
{
    printf("Hello, World!\n");
    fork();
    printf("Hello, World! Again\n");
    return EXIT_SUCCESS;
}

