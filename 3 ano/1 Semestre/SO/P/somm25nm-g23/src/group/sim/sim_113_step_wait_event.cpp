/*
 *  \author Tiago Pita 120152
 */

#include "somm25nm.h"

namespace group
{
    void simStepWaitEvent(uint16_t cid)
    {
        uint16_t pid = simProcessorState[cid].pid;

        // Add processor to the idle list
        simProcessorState[cid].idle = true;
        simProcessorState[cid].next = simProcessorCount;
        if (simIdleHead == simProcessorCount)
        {
            simIdleHead = cid;
            simIdleTail = cid;
        }
        else
        {
            simProcessorState[simIdleTail].next = cid;
            simIdleTail = cid;
        }

        // Update the process state
        PctProcessState state = BLOCKED;
        pctSet(pid, PctState, &state);

        // Get the duration of the next IO burst and advance index to the next burst
        uint32_t jid;
        pctGet(pid, PctJid, &jid);

        double ioBurstDuration;
        jobGet(jid, JobNextBurstDuration, &ioBurstDuration);

        uint32_t nextBurstIndex;
        jobGet(jid, JobNextBurstIndex, &nextBurstIndex);
        nextBurstIndex++;
        jobSet(jid, JobNextBurstIndex, &nextBurstIndex);

        // Schedule an EVENT_OCCURS event
        feqInsert(simTime + ioBurstDuration, EVENT_OCCURS, pid);

        // Schedule a DISPATCH event
           /* insert DISPATCH event (only if a READY process exists) */
           if (not rdyIsEmpty())
              feqInsert(simTime, DISPATCH, 0);
    }
} // end of namespace group

