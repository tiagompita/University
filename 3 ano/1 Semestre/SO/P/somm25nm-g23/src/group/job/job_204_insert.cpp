/*
 *  \author Francisco Pires 112694
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

namespace group
{

// ================================================================================== //

    void jobInsert(uint32_t jid, double submissionTime, uint32_t memSize, double *burstProfile)
    {
        // Validate burst profile
        if (burstProfile == nullptr)
        {
            throw Exception(EINVAL, __func__);
        }
        
        // Count bursts and validate
        int burstCount = 0;
        bool foundZero = false;
        for (int i = 0; i < JOB_MAX_BURSTS; i++)
        {
            if (burstProfile[i] == 0)
            {
                foundZero = true;
            }
            else if (foundZero)
            {
                throw Exception(EINVAL, __func__);
            }
            else
            {
                // Valid burst value (positive)
                if (burstProfile[i] < 0)
                {
                    throw Exception(EINVAL, __func__);
                }
                burstCount++;
            }
        }
        
        // At least 1 burst and odd number of bursts
        if (burstCount == 0 || burstCount % 2 == 0)
        {
            throw Exception(EINVAL, __func__);
        }
        
        // Check if job ID already exists
        JobNode *current = jobHead;
        while (current != nullptr)
        {
            if (current->jid == jid)
            {
                throw Exception(EINVAL, __func__);
            }
            current = current->next;
        }
        
        // Allocate new node
        JobNode *newNode = (JobNode *)malloc(sizeof(JobNode));
        if (newNode == nullptr)
        {
            throw Exception(errno, __func__);
        }
        
        // Initialize the new node
        newNode->jid = jid;
        newNode->submissionTime = submissionTime;
        newNode->finishTime = JOB_UNDEF_TIME; //Só é definido quando o job termina
        newNode->memSize = memSize;
        newNode->nextBurstIndex = 0; //Indica que o burst inicial é o índice 0
        
        // Copy burst profile
        for (int i = 0; i < JOB_MAX_BURSTS; i++)
        {
            newNode->bursts[i] = burstProfile[i];
        }
        
        // Insert in sorted order (ascending by jid)
        if (jobHead == nullptr || jobHead->jid > jid)
        {
            // Insert at head
            newNode->next = jobHead;
            jobHead = newNode;
        }
        else
        {
            // Find insertion point
            JobNode *prev = jobHead;
            current = jobHead->next;
            
            while (current != nullptr && current->jid < jid)
            {
                prev = current;
                current = current->next;
            }
            
            // Insert after prev
            newNode->next = current;
            prev->next = newNode;
        }
    }

// ================================================================================== //

} // end of namespace group
