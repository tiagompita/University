/*
 *  \author Rafael Caçador 107370
 */

#include "feq.h"

#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{

// ================================================================================== //

    void feqClose()
    {
        /* TODO POINT: Replace next instruction with your code */
        FeqNode* current = feqHead;
        while (current != nullptr) {
            FeqNode* toDelete = current;
            current = current->next;
            delete toDelete;
        }
        
        feqHead = FEQ_UNDEF_NODE;
    }


// ================================================================================== //

} // end of namespace group

