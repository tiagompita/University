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

static int status;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond1 = PTHREAD_COND_INITIALIZER;
pthread_cond_t cond2 = PTHREAD_COND_INITIALIZER;

void *threadChild1(void *arg)
{

    int *N = (int *)arg;

    if (*N == 1) {
        status = EXIT_SUCCESS;
        pthread_exit(&status);
    }
}

void *threadChild2(void *arg)
{

    int *N = (int *)arg;

    if (*N == 1) {
        status = EXIT_SUCCESS;
        pthread_exit(&status);
    }
}

int main (int argc, char *argv[])
{

    static int N;
    printf("Choose a number between 10 and 20 (N): ");
    fflush(stdout);
    if (scanf("%d", &N) == 0) {
        fprintf(stderr, "Fail assigning N\n");
        return EXIT_FAILURE;
    }

    if (N < 10 || N > 20) {
        fprintf(stderr, "N not between 10 and 20\n");
        return EXIT_FAILURE;
    }

    
    mutex_init(&mutex, NULL);

    pthread_cond_t cond1;
    cond_init(&cond1, NULL);

    pthread_cond_t cond2;
    cond_init(&cond2, NULL);


    pthread_t thr1;
    pthread_t thr2;
    if (pthread_create(&thr1, NULL, threadChild1, &N) && pthread_create(&thr2, NULL, threadChild2, &N) != 0)
    {
        perror("Fail launching threads");
        return EXIT_FAILURE;
    }

    if (pthread_join(thr1, NULL) && pthread_join(thr2, NULL) != 0)
    {
        perror("Fail joining childs");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}

