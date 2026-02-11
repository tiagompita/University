/*
 *  \author José Santos 112909
 */

#include "somm25nm.h"

namespace group
{
    void simStepExit(uint16_t cid)
    {
        // Get the process running on this processor
        uint16_t pid = simProcessorState[cid].pid;
        
        // Add processor to idle list
        if (simIdleTail == simProcessorCount)
        {
            // List was empty
            simIdleHead = cid;
        }
        else
        {
            // Add to end of idle list
            simProcessorState[simIdleTail].next = cid;
        }
        simProcessorState[cid].idle = true;
        simProcessorState[cid].next = simProcessorCount;
        simIdleTail = cid;
        
        // Update process state
        PctProcessState stateEnded = ENDED;
        pctSet(pid, PctState, &stateEnded);
        
        // Get memory address and release memory
        uint32_t memAddr;
        pctGet(pid, PctMemAddr, &memAddr);
        if (memAddr != PCT_UNDEF_ADDRESS)
        {
            memFree(memAddr);
        }
        
        // Get job ID from process
        uint32_t jid;
        pctGet(pid, PctJid, &jid);
        
        // Update job data - set finish time
        jobSet(jid, JobFinishTime, &simTime);
        
        // Schedule an ACTIVATE event
        feqInsert(simTime, ACTIVATE, 0);
        
           // Schedule a DISPATCH event (only if a READY process exists)
           if (not rdyIsEmpty())
              feqInsert(simTime, DISPATCH, 0);
    }
} // end of namespace group

