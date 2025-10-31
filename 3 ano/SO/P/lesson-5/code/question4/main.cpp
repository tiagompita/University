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
#include "fifo.h"

struct Buffer
{
    int request;
    int response;
    bool responseReady;
    pthread_mutex_t mutex;
    pthread_cond_t cond;
};

static Buffer pool[N];
static Fifo* freeBuffers;
static Fifo* pendingRequests;

int getFreeBuffer() {
    Item item = fifoRetrieve(freeBuffers);
    return (int)item.id;
}

void putRequestData(int data, int id) {
    mutex_lock(&pool[id].mutex);
    pool[id].request = data;
    pool[id].responseReady = false;
    mutex_unlock(&pool[id].mutex);
}

void submitRequest(int id) {
    Item item = {(uint32_t)id, 0, 0};
    fifoInsert(pendingRequests, item);
}

void waitForResponse(int id) {
    mutex_lock(&pool[id].mutex);
    while (!pool[id].responseReady) {
        cond_wait(&pool[id].cond, &pool[id].mutex);
    }
    mutex_unlock(&pool[id].mutex);
}

int getResponseData(int id) {
    mutex_lock(&pool[id].mutex);
    int resp = pool[id].response;
    mutex_unlock(&pool[id].mutex);
    return resp;
}

void releaseBuffer(int id) {
    Item item = {(uint32_t)id, 0, 0};
    fifoInsert(freeBuffers, item);
}

void *clientLifeCycle(void *arg)
{
    int clientId = *(int *)arg;

    for (int i = 0; i < 3; i++)
    { // cada cliente faz 3 pedidos
        int id = getFreeBuffer();
        int requestData = clientId * 100 + i;

        printf("Client %d: got buffer %d, request=%d\n", clientId, id, requestData);

        putRequestData(requestData, id);
        submitRequest(id);
        waitForResponse(id);

        int response = getResponseData(id);
        printf("Client %d: buffer %d, response=%d\n", clientId, id, response);

        releaseBuffer(id);
    }

    return NULL;
}

int getPendingRequest()
{
    Item item = fifoRetrieve(pendingRequests); // bloqueia se vazia
    return (int)item.id;
}

int getRequestData(int id)
{
    mutex_lock(&pool[id].mutex);
    int req = pool[id].request;
    mutex_unlock(&pool[id].mutex);
    return req;
}

int produceResponse(int req)
{
    return req * 2; // exemplo: resposta = pedido * 2
}

void putResponseData(int resp, int id)
{
    mutex_lock(&pool[id].mutex);
    pool[id].response = resp;
    mutex_unlock(&pool[id].mutex);
}

void notifyClient(int id)
{
    mutex_lock(&pool[id].mutex);
    pool[id].responseReady = true;
    cond_signal(&pool[id].cond);
    mutex_unlock(&pool[id].mutex);
}

/* --- Server thread lifecycle --- */
void *serverLifeCycle(void *arg)
{
    int serverId = *(int *)arg;

    for (int i = 0; i < 3; i++)
    { // cada servidor processa 3 pedidos
        int id = getPendingRequest();
        int req = getRequestData(id);

        printf("Server %d: processing buffer %d, request=%d\n", serverId, id, req);

        int resp = produceResponse(req);
        putResponseData(resp, id);
        notifyClient(id);
    }

    return NULL;
}

int main (int argc, char *argv[])
{
    // init
    for (int i = 0; i < N; i++) {
        pool[i].request = 0;
        pool[i].response = 0;
        pool[i].responseReady = false;
        pool[i].mutex = PTHREAD_MUTEX_INITIALIZER;
        pool[i].cond = PTHREAD_COND_INITIALIZER;
    }

    freeBuffers = (Fifo *)malloc(sizeof(Fifo));
    fifoInit(freeBuffers);

    for (int i = 0; i < N; i++) {
        Item item = {(uint32_t)i, 0, 0};
        fifoInsert(freeBuffers, item);
    }

    pendingRequests = (Fifo *)malloc(sizeof(Fifo));
    fifoInit(pendingRequests);

    printf("Setup completo: %d buffers livres\n", N);

    /* create client and server threads */
    int nc = 2;
    int ns = 2; 

    pthread_t clients[nc], servers[ns];
    int clientIds[nc], serverIds[ns];

    for (int i = 0; i < nc; i++)
    {
        clientIds[i] = i + 1;
        thread_create(&clients[i], NULL, clientLifeCycle, &clientIds[i]);
    }

    for (int i = 0; i < ns; i++)
    {
        serverIds[i] = i + 1;
        thread_create(&servers[i], NULL, serverLifeCycle, &serverIds[i]);
    }

    /* wait for threads */
    for (int i = 0; i < nc; i++)
    {
        thread_join(clients[i], NULL);
    }

    for (int i = 0; i < ns; i++)
    {
        thread_join(servers[i], NULL);
    }

    printf("Todas as threads terminaram\n");

    for (int i = 0; i < N; i++) {
        mutex_destroy(&pool[i].mutex);
        cond_destroy(&pool[i].cond);
    }

    fifoDestroy(freeBuffers);
    fifoDestroy(pendingRequests);
    free(freeBuffers);
    free(pendingRequests);
    return EXIT_SUCCESS;
}

