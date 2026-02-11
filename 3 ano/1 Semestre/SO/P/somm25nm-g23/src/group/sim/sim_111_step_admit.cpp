/*
 *  \author José Santos 112909
 */

#include "somm25nm.h"

namespace group
{
    void simStepAdmit(uint16_t pid)
    {
        // Get job ID from process
        uint32_t jid;
        pctGet(pid, PctJid, &jid);

        // Get memory size required
        uint32_t memSize;
        jobGet(jid, JobMemSize, &memSize);

        // Try to allocate memory
        uint32_t memAddr = memAlloc(pid, memSize);

        if (memAddr != 0)
        {
            // Memory allocation succeeded - update process
            pctSet(pid, PctMemAddr, &memAddr);
            PctProcessState stateReady = READY;
            pctSet(pid, PctState, &stateReady);

            // Get the next burst duration for the job (runTime)
            double runTime;
            jobGet(jid, JobNextBurstDuration, &runTime);

            if (runTime < 0)
                runTime = -runTime;

            // Insert into RDY queue with correct runTime
            rdyInsert(pid, simTime, runTime);

            // If there are idle processors, schedule a DISPATCH event
            if (simIdleHead != simProcessorCount)
            {
                feqInsert(simTime, DISPATCH, 0);
            }
        }
        else
        {
            // Memory allocation failed - insert into SWP queue
            PctProcessState stateSReady = S_READY;
            pctSet(pid, PctState, &stateSReady);

            swpInsert(pid, memSize, false);
        }
    }
} // end of namespace group

