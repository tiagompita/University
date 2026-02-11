/*
 *  \author Francisco Pires 112694
 */

#include "feq.h"

#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{

// ================================================================================== //

    bool feqRetrieve(double *time, FeqEventType *type, uint32_t *xid, bool blocking)
    {
        // Check if module is open
        if (feqHead == FEQ_UNDEF_NODE)
            throw Exception(EINVAL, __func__);

        if (time == nullptr || type == nullptr || xid == nullptr)
            throw Exception(EINVAL, __func__);

        // Check if queue is empty
        if (feqHead == nullptr) {
            // Regra do Retorno: "\return false if blocking is false and the queue is empty"
            if (!blocking) {
                return false; 
            } else {
                // Se for blocking=true e a fila está vazia, num simulador sequencial não podemos "esperar".
                throw Exception(EINVAL, __func__);
            }
        }
        
        // Pointer to the first node
        FeqNode *nodeToRemove = feqHead;
        
        // Copy node data to output parameters
        *time = nodeToRemove->time;
        *type = nodeToRemove->type;
        *xid = nodeToRemove->xid;
        
        // Point to next node
        feqHead = nodeToRemove->next;
        
        // Free memory of removed node
        delete nodeToRemove;
        
        return true;
    }

// ================================================================================== //

} // end of namespace group

