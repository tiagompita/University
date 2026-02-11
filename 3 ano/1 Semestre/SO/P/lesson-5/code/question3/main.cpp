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

static int N;
static int status;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t condOdd = PTHREAD_COND_INITIALIZER;
pthread_cond_t condEven = PTHREAD_COND_INITIALIZER;

void *threadChild1(void *arg)
{
    while (1)
    {
        mutex_lock(&mutex);
        while ((N % 2 == 0) && (N > 0))
        { // espera enquanto NÃO é a vez do child1
            cond_wait(&condOdd, &mutex);
        }
        if (N < 1) {
            cond_signal(&condEven);             
            mutex_unlock(&mutex);
            break;
        }
        printf("Thread1 (pid %d): %d\n", (int)getpid(), N);
        N--;
        cond_signal(&condEven); // acorda a outra thread
        mutex_unlock(&mutex);
    }

    status = EXIT_SUCCESS;
    pthread_exit(&status);
}

void *threadChild2(void *arg)
{
    while (1)
    {
        mutex_lock(&mutex);
        while ((N % 2 != 0) && (N > 0))
        { 
            cond_wait(&condEven, &mutex);
        }
        if (N < 1) {
            cond_signal(&condOdd);
            mutex_unlock(&mutex);
            break;
        }
        printf("Thread2 (pid %d): %d\n", (int)getpid(), N);
        N--;
        cond_signal(&condOdd); // acorda a outra thread
        mutex_unlock(&mutex);
    }

    status = EXIT_SUCCESS;
    pthread_exit(&status);
}

int main (int argc, char *argv[])
{

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

    pthread_t thr1;
    pthread_t thr2;
    thread_create(&thr1, NULL, threadChild1, NULL);
    thread_create(&thr2, NULL, threadChild2, NULL);

    thread_join(thr1, NULL);
    thread_join(thr2, NULL);


    return EXIT_SUCCESS;
}

