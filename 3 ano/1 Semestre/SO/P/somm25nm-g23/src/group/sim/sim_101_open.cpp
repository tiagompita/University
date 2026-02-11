/*
 *  \author Francisco Pires 112694
 */

#include "somm25nm.h"
#include <stdint.h>

namespace group
{
    void simOpen(SimParameters *param)
    {
        // Initialize simulation time
        simTime = 0.0;
        
        // Initialize processor count and state array
        simProcessorCount = param->processorCount;
        simProcessorState = new SimProcessorState[simProcessorCount];
        
        // Initialize all processors as idle and build the idle list
        for (uint32_t i = 0; i < simProcessorCount; i++)
        {
            simProcessorState[i].idle = true;
            if (i < simProcessorCount - 1)
            {
                simProcessorState[i].next = i + 1;
            }
            else
            {
                simProcessorState[i].next = simProcessorCount; // Last idle processor
            }
        }
        
        // Set idle list head and tail
        simIdleHead = 0;
        simIdleTail = simProcessorCount - 1;
        
        // Open satellite modules
        jobOpen();
        pctOpen(param->basePid, param->maxPids);
        feqOpen();
        rdyOpen(param->schedulingPolicy);
        swpOpen(param->swappingPolicy);
        memOpen(param->memInitAddr, param->memMinLogSize, param->memSizes, param->memSizesCount);
    }
} // end of namespace group
