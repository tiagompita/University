/*
 *  \author Francisco Pires 112694
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void rdyClose()
    {
        // Free all nodes in the list
        RdyNode *current = rdyHead;
        while (current != nullptr) {
            RdyNode *toDelete = current;
            current = current->next;
            delete toDelete;
        }
        
        // Set to closed state
        rdyHead = RDY_UNDEF_NODE;
        rdyPolicy = RDY_UNDEF_POLICY;
    }
} // end of namespace group


