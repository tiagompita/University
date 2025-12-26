/*
 *  \author Ana Santos 120039 
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpUnblock(uint16_t pid)
    {
        // Search for the process in the list
        SwpNode *current = swpHead;
        
        while (current != NULL)
        {
            if (current->pid == pid)
            {
                // Found the process - unblock it
                current->blocked = false;
                return;
            }
            current = current->next;
        }

        throw Exception(EINVAL, __func__);

    }
} // end of namespace group


