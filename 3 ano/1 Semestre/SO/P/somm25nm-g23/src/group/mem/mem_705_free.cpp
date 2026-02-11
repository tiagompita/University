/*
 *  \author Ana Santos 120039
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void memFree(uint32_t addr)
    {
        // Find the block in the occupied list by address
        MemNode *current = memOccupiedHead;
        MemNode *prev = NULL;
        MemNode *blockToFree = NULL;
        
        while (current != NULL)
        {
            if (current->addr == addr)
            {
                blockToFree = current;
                break;
            }
            prev = current;
            current = current->next;
        }
        
        // If block not found, throw exception
        if (blockToFree == NULL)
        {
            throw Exception(EINVAL, __func__);
        }
        
        // Remove from occupied list
        if (prev == NULL)
        {
            // Removing the head of occupied list
            memOccupiedHead = blockToFree->next;
        }
        else
        {
            prev->next = blockToFree->next;
        }
        
        // Mark as free
        blockToFree->pid = 0;
        blockToFree->next = NULL;
        
        // Insert into free list (sorted by logSize, then by insertion order)
        if (memFreeHead == NULL)
        {
            // Free list is empty
            memFreeHead = blockToFree;
        }
        else
        {
            // Find correct position in free list (sorted by logSize)
            MemNode *freeCurrent = memFreeHead;
            MemNode *freePrev = NULL;
            
            // Find position: blocks are sorted by logSize
            while (freeCurrent != NULL && freeCurrent->logSize <= blockToFree->logSize)
            {
                freePrev = freeCurrent;
                freeCurrent = freeCurrent->next;
            }
            
            // Insert at found position
            if (freePrev == NULL)
            {
                // Insert at head
                blockToFree->next = memFreeHead;
                memFreeHead = blockToFree;
            }
            else
            {
                // Insert after freePrev
                blockToFree->next = freePrev->next;
                freePrev->next = blockToFree;
            }
        }
    }
} // end of namespace group


