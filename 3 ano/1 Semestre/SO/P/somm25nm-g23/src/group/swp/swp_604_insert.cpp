/*
 *  \author José Santos 112909
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpInsert(uint16_t pid, uint32_t size, bool blocked)
    {
        // Create new node
        SwpNode *newNode = new SwpNode();
        if (newNode == nullptr) {
            throw Exception(ENOMEM, __func__);
        }

        newNode->pid = pid;
        newNode->size = size;
        newNode->blocked = blocked;
        newNode->next = nullptr;

        // If list is empty, insert at head
        if (swpHead == nullptr) {
            swpHead = newNode;
            swpTail = newNode;
        }
        else {
            // Add to tail (insertion order)
            swpTail->next = newNode;
            swpTail = newNode;
        }
    }
} // end of namespace group


