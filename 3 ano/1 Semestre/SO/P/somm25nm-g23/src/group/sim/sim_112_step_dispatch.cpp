/*
 *  \author Daniel Oliveira 115359
 */

#include "somm25nm.h"

namespace group
{
    void simStepDispatch()
    {
        // Retrieve a process from the RDY queue
        uint16_t pid = rdyRetrieve(simTime);
        
        // If queue is empty (pid == 0), do nothing
        if (pid == 0)
        {
            return;
        }
        
        // Retrieve the ID of the oldest idle processor/core from the list of idle processors/cores
        uint16_t cid = simIdleHead;
        
        // Update idle list - remove processor from idle list
        simIdleHead = simProcessorState[cid].next;
        
        // If this was the last idle processor, update tail
        if (simIdleHead == simProcessorCount)
        {
            simIdleTail = simProcessorCount;
        }
        
        // Update processor/core state - mark as in use
        simProcessorState[cid].idle = false;
        simProcessorState[cid].pid = pid;
        
        // Update process state to RUNNING
        PctProcessState state = RUNNING;
        pctSet(pid, PctState, &state);
        
        // Get the job ID of the process
        uint32_t jid;
        pctGet(pid, PctJid, &jid);
        
        // Get the duration of the next CPU burst
        double cpuBurstDuration;
        jobGet(jid, JobNextBurstDuration, &cpuBurstDuration);
        
        // Advance index to the next burst
        uint32_t nextBurstIndex;
        jobGet(jid, JobNextBurstIndex, &nextBurstIndex);
        nextBurstIndex++;
        jobSet(jid, JobNextBurstIndex, &nextBurstIndex);
        
        // If it is the last CPU-burst (negative duration), schedule an EXIT event
        if (cpuBurstDuration < 0.0)
        {
            double exitTime = simTime + fabs(cpuBurstDuration);
            feqInsert(exitTime, EXIT, cid);
        }
        else
        {
            // Otherwise, schedule a WAIT_EVENT event
            double waitEventTime = simTime + cpuBurstDuration;
            feqInsert(waitEventTime, WAIT_EVENT, cid);
        }
    }
} // end of namespace group

