/*
 *  \author Ana Santos 120039
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    uint16_t rdyRetrieve(double curTime)
    {
        if (rdyHead == NULL)
        {
            return 0;
        }
        
        uint16_t resultPid = 0;
        RdyNode *toRemove = NULL;
        RdyNode *prevToRemove = NULL;
        
        // Handle different scheduling policies
        if (rdyPolicy == SPN || rdyPolicy == SRT)
        {
            // For SPN/SRT, list is already sorted by burst time -> remove and return head
            toRemove = rdyHead;
            resultPid = rdyHead->pid;
            rdyHead = rdyHead->next;
        }
        else if (rdyPolicy == HRRN)
        {
            // For HRRN, calculate response ratio for each process
            // Response Ratio = (Wait Time + Service Time) / Service Time where Wait Time = curTime - queueTime
            
            double maxRatio = -1.0;
            RdyNode *current = rdyHead;
            RdyNode *prev = NULL;
            
            while (current != NULL)
            {
                double waitTime = curTime - current->queueTime;
                double responseRatio = (waitTime + current->runTime) / current->runTime;
                
                if (responseRatio > maxRatio)
                {
                    maxRatio = responseRatio;
                    toRemove = current;
                    prevToRemove = prev;
                }
                
                prev = current;
                current = current->next;
            }
            
            resultPid = toRemove->pid;
            
            // Remove the node from the list
            if (prevToRemove == NULL)
            {
                // Removing the head
                rdyHead = toRemove->next;
            }
            else
            {
                prevToRemove->next = toRemove->next;
            }
        }
        else
        {
            throw Exception(ENOSYS, __func__);
        }
        
        // Free the removed node
        delete toRemove;
        
        return resultPid;

    }
} // end of namespace group


