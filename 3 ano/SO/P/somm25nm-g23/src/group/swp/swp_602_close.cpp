/*
 *  \author Francisco Pires 112694
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpClose()
    {
        // Free all nodes in the list
        SwpNode *current = swpHead;
        while (current != nullptr) {
            SwpNode *toDelete = current;
            current = current->next;
            delete toDelete;
        }
        
        // Set to closed state
        swpHead = SWP_UNDEF_NODE;
        swpTail = SWP_UNDEF_NODE;
        swpPolicy = SWP_UNDEF_POLICY;
    }
} // end of namespace group

