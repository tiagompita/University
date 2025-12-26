/*
 *  \author Rafael Caçador 107370
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>
#include <math.h>

namespace group
{
    uint32_t memAlloc(uint32_t pid, uint32_t size)
    {
        // Check if module is open
        if (memBlocks == MEM_UNDEF_NODE) {
            throw Exception(EINVAL, __func__);
        }
        
        // Validate parameters
        if (pid == 0 || size == 0) {
            throw Exception(EINVAL, __func__);
        }
        
        // Calculate the minimum log size needed for the requested size
        // We need: 2^logSize >= size
        uint16_t neededLogSize = (uint16_t)ceil(log2((double)size));
        
        // Make sure it's at least the minimum log size
        if (neededLogSize < memMinLogSize) {
            neededLogSize = memMinLogSize;
        }
        
        // Search for the smallest free block that fits
        // The free list is sorted by log size and insertion time
        MemNode *current = memFreeHead;
        MemNode *prev = nullptr;
        MemNode *bestFit = nullptr;
        MemNode *bestFitPrev = nullptr;
        
        while (current != nullptr) {
            // Check if this block is big enough
            if (current->logSize >= neededLogSize) {
                // First fit strategy: take the first block that fits
                bestFit = current;
                bestFitPrev = prev;
                break;
            }
            prev = current;
            current = current->next;
        }
        
        // If no block found, return 0
        if (bestFit == nullptr) {
            return 0;
        }
        
        // Remove block from free list
        if (bestFitPrev == nullptr) {
            // Removing head
            memFreeHead = bestFit->next;
        } else {
            bestFitPrev->next = bestFit->next;
        }
        
        // Assign the block to the process
        bestFit->pid = pid;
        bestFit->next = nullptr;
        
        // Insert into occupied list (sorted by address)
        if (memOccupiedHead == nullptr || bestFit->addr < memOccupiedHead->addr) {
            // Insert at head
            bestFit->next = memOccupiedHead;
            memOccupiedHead = bestFit;
        } else {
            // Find position to insert (sorted by address)
            MemNode *occCurrent = memOccupiedHead;
            while (occCurrent->next != nullptr && occCurrent->next->addr < bestFit->addr) {
                occCurrent = occCurrent->next;
            }
            bestFit->next = occCurrent->next;
            occCurrent->next = bestFit;
        }
        
        // Return the address of the allocated block
        return bestFit->addr;
    }
} // end of namespace group