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

#include "utils.h"
#include "thread.h"

int status;

void *threadChild (void *arg) {

    int N2;
    int *N1 = (int *)arg;
    printf("Choose a number between 10 and 20 (N2): ");
    fflush(stdout);
    if (scanf("%d", &N2) == 0)
    {
        fprintf(stderr, "Fail assigning N2\n");
        status = EXIT_FAILURE;
    }

    if (N2 < 10 || N2 > 20)
    {
        fprintf(stderr, "N1 not between 1 and 9\n");
        status = EXIT_FAILURE;
    }

    for(; *N1 <= N2; (*N1)++) {
        printf("N1 (child): %d\n", *N1);
    }

    status = EXIT_SUCCESS;
    pthread_exit(&status);

}

int main (int argc, char *argv[])
{

    static int N1;
    printf("Choose a number between 1 and 9 (N1): ");
    fflush(stdout);
    if (scanf("%d", &N1) == 0) {
        fprintf(stderr, "Fail assigning N1\n");
        return EXIT_FAILURE;
    }

    if (N1 < 1 || N1 > 9) {
        fprintf(stderr, "N1 not between 1 and 9\n");
        return EXIT_FAILURE;
    }


    pthread_t thr;
    if (pthread_create(&thr, NULL, threadChild, &N1) != 0)
    {
        perror("Fail launching thread");
        return EXIT_FAILURE;
    }

    if (pthread_join(thr, NULL) != 0)
    {
        perror("Fail joining child");
        return EXIT_FAILURE;
    }

    N1--;
    for (; N1 >= 1; N1--) {
        printf("N1: %d\n", N1);
    }

    return EXIT_SUCCESS;
}

