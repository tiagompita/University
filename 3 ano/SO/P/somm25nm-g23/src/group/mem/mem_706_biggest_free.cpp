/*
 *  \author Daniel Oliveira 115359
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    uint32_t memBiggestFreeBlock()
    {
        // Walk the free list and pick the largest block size (if list is empty, return 0)
        uint32_t biggest = 0;

        for (MemNode *node = memFreeHead; node != nullptr; node = node->next)
        {
            uint32_t blockSize = 1u << node->logSize;
            if (blockSize > biggest) biggest = blockSize;
        }

        return biggest;
    }
} // end of namespace group


