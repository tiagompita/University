#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#include "linked-list.h"

/*******************************************************/

SllNode* sllDestroy(SllNode* list)
{
    return list;
}

/*******************************************************/

void sllPrint(SllNode *list, FILE *fout)
{
    SllNode* current = list;
    
    while (current != NULL) {
        // Imprimir no formato: nmec;nome
        fprintf(fout, "%u;%s\n", current->reg.nmec, current->reg.name);
        current = current->next;
    }
}

/*******************************************************/

SllNode* sllInsert(SllNode* list, uint32_t nmec, const char *name)
{
    assert(name != NULL && name[0] != '\0');
    assert(!sllExists(list, nmec));

    // Criar novo nó
    SllNode* newNode = (SllNode*)malloc(sizeof(SllNode));
    if (newNode == NULL) {
        return list; // Falha na alocação de memória
    }
    
    // Inicializar o novo nó
    newNode->reg.nmec = nmec;
    newNode->reg.name = (char*)malloc(strlen(name) + 1);
    if (newNode->reg.name == NULL) {
        free(newNode);
        return list; // Falha na alocação de memória
    }
    strcpy(newNode->reg.name, name);
    newNode->next = NULL;
    
    // Caso 1: Lista vazia ou inserir no início
    if (list == NULL || list->reg.nmec > nmec) {
        newNode->next = list;
        return newNode;
    }
    
    // Caso 2: Inserir no meio ou no fim
    SllNode* current = list;
    while (current->next != NULL && current->next->reg.nmec < nmec) {
        current = current->next;
    }
    
    newNode->next = current->next;
    current->next = newNode;
    
    return list;
}

/*******************************************************/

bool sllExists(SllNode* list, uint32_t nmec)
{
    SllNode* current = list;
    while (current != NULL) {
        if (current->reg.nmec == nmec) {
            return true;
        }
        // Como a lista está ordenada, se encontrarmos um nmec maior, 
        // podemos parar a busca
        if (current->reg.nmec > nmec) {
            break;
        }
        current = current->next;
    }
    return false;
}

/*******************************************************/

SllNode* sllRemove(SllNode* list, uint32_t nmec)
{
    assert(list != NULL);
    assert(sllExists(list, nmec));

    return list;
}

/*******************************************************/

const char *sllGetName(SllNode* list, uint32_t nmec)
{
    assert(list != NULL);
    assert(sllExists(list, nmec));

    return NULL;
}

/*******************************************************/

SllNode* sllLoad(SllNode *list, FILE *fin, bool *ok)
{
    assert(fin != NULL);

    if (ok != NULL)
       *ok = false; // load failure

    return NULL;
}

/*******************************************************/

