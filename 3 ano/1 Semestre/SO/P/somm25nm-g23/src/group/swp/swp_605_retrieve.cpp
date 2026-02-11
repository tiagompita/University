/*
 *  \author Tiago Pita 120152
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    uint16_t swpRetrieve(uint32_t sizeAvailable, bool canBeBlocked)
    {
        if (swpHead == nullptr) {
            return 0;
        }

        SwpNode *current = swpHead;
        SwpNode *previous = nullptr;

        // ponteiros para guardar o melhor candidato encontrado
        SwpNode *candidate = nullptr;
        SwpNode *candidatePrev = nullptr;

        while (current != nullptr)
        {
            if (current->size <= sizeAvailable)
            {
                // Aceitamos se for Ready ou se permitirmos Blocked
                if (!current->blocked || canBeBlocked)
                {
                    bool isBetter = false;

                    // Se ainda não temos candidato, este é o melhor até agora
                    if (candidate == nullptr) {
                        isBetter = true;
                    }
                    else 
                    {
                        // Se já temos candidato, comparamos com o atual
                        
                        // Ready ganha sempre a Blocked
                        if (!current->blocked && candidate->blocked) {
                            isBetter = true;
                        }
                        else if (current->blocked && !candidate->blocked) {
                            isBetter = false; // O atual é Blocked e já temos um Ready
                        }
                        // Se o estado for igual
                        else 
                        {
                            // Ambos Ready ou Ambos Blocked
                            if (swpPolicy == FirstFit)
                            {
                                // No FirstFit, o primeiro que encontrámos ganha 
                                isBetter = false;
                            }
                            else if (swpPolicy == FirstBest)
                            {
                                // No FirstBest, ganha o maior.
                                if (current->size > candidate->size) {
                                    isBetter = true;
                                }
                            }
                        }
                    }

                    if (isBetter)
                    {
                        candidate = current;
                        candidatePrev = previous;

                        // Se encontrámos um processo READY, 
                        // e estamos em FirstFit, não vamos encontrar nada "melhor"
                        if (swpPolicy == FirstFit && !candidate->blocked) {
                            break;
                        }
                    }
                }
            }

            previous = current;
            current = current->next;
        }

        if (candidate == nullptr) { //nenhum candidato válido
            return 0;
        }

        if (candidate == swpHead) {
            swpHead = candidate->next;
        } else {
            candidatePrev->next = candidate->next;
        }

        if (candidate == swpTail) {
            swpTail = candidatePrev;
        }

        uint16_t pid = candidate->pid;
        delete candidate;

        return pid;
    }
} // end of namespace group


