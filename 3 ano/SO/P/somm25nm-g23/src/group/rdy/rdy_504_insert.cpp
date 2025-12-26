/*
 *  \author Rafael Caçador 107370
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void rdyInsert(uint16_t pid, double curTime, double runTime)
    {
        // See if module is open
        if (rdyHead == RDY_UNDEF_NODE) {
            throw Exception(EINVAL, __func__);
        }
        
        // Validate parameters
        if (pid == 0) {
            throw Exception(EINVAL, __func__);
        }
        
        if (curTime < 0 || runTime <= 0) {
            throw Exception(EINVAL, __func__);
        }
        
        // Create new node
        RdyNode *newNode = new (std::nothrow) RdyNode;
        if (newNode == nullptr) {
            throw Exception(ENOMEM, __func__);
        }
        
        // Initialize node fields
        newNode->pid = pid;
        newNode->queueTime = curTime;
        newNode->runTime = runTime;
        newNode->next = nullptr;
        
        // Insert in sorted order (ascending order of burst duration / runTime)
        // This works for SPN and SRT policies
        
        // Case 1: Empty list
        if (rdyHead == nullptr) {
            rdyHead = newNode;
            return;
        }
        
        // Case 2: Insert at head (new node has smallest runTime)
        if (runTime < rdyHead->runTime) {
            newNode->next = rdyHead;
            rdyHead = newNode;
            return;
        }
        
        // Case 3: Insert in the middle or at the end
        RdyNode *current = rdyHead;
        while (current->next != nullptr && current->next->runTime <= runTime) {
            current = current->next;
        }
        
        // Insert after current
        newNode->next = current->next;
        current->next = newNode;
    }
} // end of namespace group