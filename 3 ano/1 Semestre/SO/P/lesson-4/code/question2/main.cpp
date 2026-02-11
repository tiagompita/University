/*
 * An implementation of the bounded-buffer problem
 *
 * NC producers and NC consumers communicate through a fifo.
 * The fifo has a fixed capacity.
 * NI items will be produced by the producers and consume by the consumers.
 * An item is composed of 2 equal integers, ranging from 1 to NI.
 */

#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <math.h>
#include <libgen.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "process.h"

int main(void)
{
    int shmid;

    shmid = pshmget(IPC_PRIVATE, sizeof(int), 0600 | IPC_CREAT | IPC_EXCL);

    int *pcounter = (int*)pshmat(shmid, NULL, 0);

    *pcounter = 1;

    pid_t fork_id = pfork();

    if (fork_id == 0) {
        int n;
        printf("Contar até quanto? ");
        fflush(stdout);
        scanf("%d", &n);
        if (n <= 0) {
            exit(EXIT_FAILURE);
        }

        while (*pcounter <= n) {
            printf("Child: %d\n", *pcounter);

            (*pcounter)++;
        };

        exit(EXIT_SUCCESS);
    } else {
        pwait(NULL);
        (*pcounter)--;
        while (*pcounter > 0)
        {
            printf("Parent: %d\n", *pcounter);

            (*pcounter)--;
        };
    }

    pshmdt(pcounter);

    pshmctl(shmid, IPC_RMID, NULL);

    exit(EXIT_SUCCESS);
    return 0;
}
