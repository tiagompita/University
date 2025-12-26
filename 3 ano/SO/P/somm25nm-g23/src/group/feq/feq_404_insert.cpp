/*
 *  \author Ana Santos 120039
 */

#include "feq.h"

#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{

// ================================================================================== //

    // Função auxiliar para determinar a prioridade do evento (Menor valor = Maior prioridade)
    // Baseado nas regras do feq.h
    static int get_rank(FeqEventType type) 
    {
        if (type == DISPATCH) 
            return 0; 
        
        if (type == WAIT_EVENT || type == EXIT || type == TIMEOUT || type == PREEMPT) 
            return 1;
            
        return 2;
    }

    void feqInsert(double time, FeqEventType type, uint32_t xid)
    {
        /* TODO POINT: Replace next instruction with your code */
        if (feqHead == FEQ_UNDEF_NODE) {
            throw Exception(EINVAL, __func__);
        }

        // lançar a excessão se o tempo for negativo
        if (time < 0) {
            throw Exception(EINVAL, __func__);
        }

        FeqNode* newNode = nullptr;
        try {
            newNode = new FeqNode{time, type, xid, nullptr};
        } catch (std::bad_alloc &e) {
            throw Exception(ENOMEM, __func__);
        }

        // inserir o novo nó na posição correta para manter a ordem crescente por tempo
        if (feqHead == nullptr || feqHead->time > time ||                           // se tempos iguais, ordenar por tipo
            (feqHead->time == time && get_rank(feqHead->type) > get_rank(type))) {                      // inserir no início
            newNode->next = feqHead;                                                // atualizar a cabeça da lista
            feqHead = newNode;                                                      // nova cabeça
        } else {
            FeqNode* current = feqHead;                                             // encontrar a posição correta
            while (current->next != nullptr &&                  
                   (current->next->time < time ||                                   // se tempos iguais, ordenar por tipo
                   (current->next->time == time && 
                    get_rank(current->next->type) <= get_rank(type)))) {            // avançar na lista
                current = current->next;                                            // até encontrar a posição correta
            }
            newNode->next = current->next;                                          // inserir o novo nó na lista
            current->next = newNode;                                                // atualizar o próximo do nó atual
        }
    }

// ================================================================================== //

} // end of namespace group

