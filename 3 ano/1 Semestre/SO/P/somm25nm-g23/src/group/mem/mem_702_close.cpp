/*
 *  \author Tiago Pita 120152
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void memClose() 
    {
        if (memBlocks != MEM_UNDEF_NODE)
        {
            delete[] memBlocks;
        }

        memBlocks = MEM_UNDEF_NODE;
        memFreeHead = MEM_UNDEF_NODE;
        memOccupiedHead = MEM_UNDEF_NODE;

        memBlockCount = 0;
        memMinLogSize = 0;
    }
} // end of namespace group


