#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#include "linked-list.h"

/*******************************************************/

/**
 * \brief The data to be stored in the list
 */
struct Student
{
    uint32_t nmec;        ///< Student number
    char *name;     ///< Student name
};

/**
 * \brief The linked-list support data structure:
 */
struct SllNode 
{
    Student reg;          ///< Student data
    struct SllNode *next;    ///< Pointer to next node
};

/*******************************************************/

static SllNode *list = NULL;

/*******************************************************/

void sllDestroy()
{
    while (list != NULL)
    {
        SllNode *toFree = list;
        free(toFree->reg.name); // libertar o nome alocado
        free(toFree);           // libertar o nó

        list = list->next;
    }
    return;
}

/*******************************************************/

void sllPrint(FILE *fout)
{
    SllNode *current = list;

    while (current != NULL)
    {
        // Imprimir no formato: nmec;nome
        fprintf(fout, "%u;%s\n", current->reg.nmec, current->reg.name);
        current = current->next;
    }
}

/*******************************************************/

void sllInsert(uint32_t nmec, const char *name)
{
    assert(name != NULL && name[0] != '\0');
    assert(!sllExists(nmec));

    SllNode* newNode = (SllNode*)malloc(sizeof(SllNode));
    if (newNode == NULL) {
        printf("Error allocating memory (newNode)");
        return;
    }

    newNode->reg.nmec = nmec;
    newNode->reg.name = (char*)malloc(strlen(name) + 1);
    if (newNode->reg.name == NULL) {
        free(newNode);
        printf("Error allocating memory (name)");
        return;
    }
    strcpy(newNode->reg.name, name);
    newNode->next = NULL;

    if (list == NULL || list->reg.nmec > nmec)
    {
        // Antes:   head -> [200] -> [300] -> NULL 
        //          newNode = [100] -> NULL
        
        newNode->next = list;
        // Depois só com newNode->next = head : 
        //      newNode->[100]->[200]->[300]->NULL 
        //      head->[200]->[300]->NULL
        //  head não mudou, novo nó isolado da head
        
        list = newNode;
        // Depois com list = newNode: 
        //      head -> [100] -> [200] -> [300] -> NULL
        return;
    }

    SllNode *current = list;
    while (current->next != NULL && current->next->reg.nmec < nmec)
    {
        current = current->next;
    }

    newNode->next = current->next;
    current->next = newNode;

    return;
}

/*******************************************************/

bool sllExists(uint32_t nmec)
{
    SllNode *current = list;
    while (current != NULL)
    {
        if (current->reg.nmec == nmec)
        {
            return true;
        }
        // Como a lista está ordenada, se encontrarmos um nmec maior,
        // podemos parar a busca
        if (current->reg.nmec > nmec)
        {
            break;
        }
        current = current->next;
    }
    return false;
}

/*******************************************************/

void sllRemove(uint32_t nmec)
{
    assert(sllExists(nmec));

    /* remover cabeça? */
    if (list->reg.nmec == nmec)
    {
        SllNode *tofree = list;
        free(tofree->reg.name);
        free(tofree);

        list = list->next;

        return;
    }

    /* procurar nó anterior ao que vamos remover */
    SllNode *current = list;
    while (current->next != NULL && current->next->reg.nmec < nmec)
    {
        current = current->next;
    }

    if (current->next != NULL && current->next->reg.nmec == nmec)
    {
        SllNode *tofree = current->next;
        current->next = tofree->next; // == current->next->next
        free(tofree->reg.name);
        free(tofree);
    }

    return;
}

/*******************************************************/

const char *sllGetName(uint32_t nmec)
{
    assert(sllExists(nmec));

    SllNode *current = list;
    while (current != NULL)
    {

        if (current->reg.nmec == nmec)
        {
            return current->reg.name;
        }

        current = current->next;
    }

    return NULL;
}

/*******************************************************/

bool sllLoad(FILE *fin)
{
    assert(fin != NULL);

    char line[256];

    // Ler linha a linha
    while (fgets(line, sizeof(line), fin) != NULL)
    {
        // Remover quebra de linha se existir
        line[strcspn(line, "\n")] = '\0';

        // Procurar o separador ";"
        char *separator = strchr(line, ';');
        if (separator == NULL)
        {
            continue; // Linha sem separador, ignorar
        }

        // Separar nmec e name
        *separator = '\0'; // Substituir ";" por terminador
        char *nmec_str = line;
        char *name = separator + 1; // shift à direita

        // Converter nmec para número
        uint32_t nmec = atoi(nmec_str);

        // nmec e name prontos para usar
        sllInsert(nmec, name);
        
    }

    if (feof(fin))
    {
        return true;
    };

    return false;
}

/*******************************************************/

