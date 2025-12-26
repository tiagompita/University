/*
 *  \author Ana Santos 120039
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>
#include <math.h>

namespace group
{
    void memOpen(uint32_t initAddr, uint32_t minLogSize, uint32_t *sizes, uint32_t cnt)
    {
        /// Calculate total number of blocks
        memBlockCount = 0;
        for (uint32_t i = 0; i < cnt; i++){
            memBlockCount += sizes[i];
        }

        // Allocate memory for all blocks
        memBlocks = new MemNode[memBlockCount];

        // Store minimum log size
        memMinLogSize = minLogSize;

        // Initialize blocks
        uint32_t currentAddr = initAddr;
        uint32_t blockIndex = 0;

        for (uint32_t i = 0; i < cnt; i++)
        {
            uint32_t logSize = minLogSize + i;
            uint32_t blockSize = (uint32_t)pow(2, logSize);
            
            for (uint32_t j = 0; j < sizes[i]; j++)
            {
                memBlocks[blockIndex].addr = currentAddr;
                memBlocks[blockIndex].logSize = logSize;
                memBlocks[blockIndex].pid = 0; // 0 means free
                memBlocks[blockIndex].next = NULL;
                
                currentAddr += blockSize;
                blockIndex++;
            }
        }
        
        // Build the free list (sorted by logSize, then by insertion order)
        // Since we're creating blocks in ascending logSize order, we just need to link them
        memFreeHead = NULL;
        MemNode *freeTail = NULL;
        
        for (uint32_t i = 0; i < memBlockCount; i++)
        {
            if (memFreeHead == NULL)
            {
                memFreeHead = &memBlocks[i];
                freeTail = memFreeHead;
            }
            else
            {
                freeTail->next = &memBlocks[i];
                freeTail = &memBlocks[i];
            }
            memBlocks[i].next = NULL;
        }
        
        // Initialize occupied list as empty
        memOccupiedHead = NULL;

    }
} // end of namespace group

