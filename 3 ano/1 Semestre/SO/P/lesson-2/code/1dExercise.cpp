#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

#include "delays.h"
#include "process.h"

int main(void)
{
    printf("Counting 1 to 20\n");

    pid_t ret = pfork();

    if (ret == 0) { /* child */
        for (int i = 1; i <= 10; ++i) {
            printf("Child: %d\n", i);
            bwRandomDelay(1000, 20000); // opcional, para ver interleaving
        }
        return EXIT_SUCCESS;
    } else { /* parent */
        pwait(NULL); // espera o filho terminar
        for (int i = 11; i <= 20; ++i) {
            printf("Parent: %d\n", i);
            bwRandomDelay(1000, 20000); // opcional
        }
        return EXIT_SUCCESS;
    }
}