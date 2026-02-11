/*
 *  \author José Santos 112909
 */

#include "somm25nm.h"

namespace group
{
    void simStepEventOccurs(uint16_t pid)
    {
        // Get current process state
        PctProcessState state;
        pctGet(pid, PctState, &state);
        
        if (state == S_BLOCKED)
        {
            // Just unblock it - change to S_READY
            PctProcessState stateSReady = S_READY;
            pctSet(pid, PctState, &stateSReady);
        }
        else if (state == BLOCKED)
        {
            // Get job ID from process
            uint32_t jid;
            pctGet(pid, PctJid, &jid);

            // Get the next burst duration for the job (runTime)
            double runTime;
            jobGet(jid, JobNextBurstDuration, &runTime);

            if (runTime < 0)
                runTime = -runTime;

            // Add process to RDY queue with correct runTime
            rdyInsert(pid, simTime, runTime);

            // Update process state to READY
            PctProcessState stateReady = READY;
            pctSet(pid, PctState, &stateReady);

            // If applicable, schedule a DISPATCH event
            if (simIdleHead != simProcessorCount)
            {
                feqInsert(simTime, DISPATCH, 0);
            }
        }
        else
        {
            // Invalid state - throw error
            throw Exception(EPERM, __func__);
        }
    }
} // end of namespace group

