/*
 *  \author Farncisco Pires 112694
 */

#include "somm25nm.h"

namespace group
{
    void simStepActivate()
    {   
        // Get the size of the biggest free memory block
        uint32_t biggestBlock = memBiggestFreeBlock();
        
        if (biggestBlock == 0) {
            // No free memory available, cannot activate any process
            return;
        }

        // Try to retrieve a non-blocked process first (canBeBlocked = false)
        uint16_t pid = swpRetrieve(biggestBlock, false);
        
        // If no non-blocked process fits, try a blocked one
        if (pid == 0) {
            pid = swpRetrieve(biggestBlock, true);
        }
        
        // If no process fits in available memory, return
        if (pid == 0) {
            return;
        }

        // Get the memory size required by the process
        uint32_t jid;
        pctGet(pid, PctJid, &jid);
        
        uint32_t memSize;
        jobGet(jid, JobMemSize, &memSize);
        
        // Allocate memory for the process
        uint32_t memAddr = memAlloc(pid, memSize);
        
        if (memAddr == 0) {
            // Memory allocation failed (should not happen as we checked biggestBlock)
            throw Exception(ENOMEM, __func__);
        }
        
        // Update process memory address
        pctSet(pid, PctMemAddr, &memAddr);
        
        // Get current process state
        PctProcessState state;
        pctGet(pid, PctState, &state);
        
        // Update process state and handle accordingly
        if (state == S_READY) {
            // Process was suspended-ready, move to READY state
            state = READY;
            pctSet(pid, PctState, &state);
            
            // Get the next burst duration (CPU burst)
            double burstDuration;
            jobGet(jid, JobNextBurstDuration, &burstDuration);
            
            // Add process to RDY queue
            rdyInsert(pid, simTime, burstDuration);
            
            // If there are idle processors, schedule a DISPATCH event
            if (simIdleHead != simProcessorCount) {
                feqInsert(simTime, DISPATCH, 0);
            }
        }
        else if (state == S_BLOCKED) {
            // Process was suspended-blocked, move to BLOCKED state
            // It will remain blocked until its I/O completes (EVENT_OCCURS)
            state = BLOCKED;
            pctSet(pid, PctState, &state);
            
            // No need to add to RDY queue or schedule DISPATCH
            // The EVENT_OCCURS handler will take care of that when I/O completes
        }
    }
} // end of namespace group

