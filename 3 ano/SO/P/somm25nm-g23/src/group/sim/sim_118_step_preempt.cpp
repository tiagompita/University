/*
 *  \author Rafael Caçador 107370
 */

#include "somm25nm.h"

namespace group
{
    void simStepPreempt(uint16_t cid)
    {
        // Preemption is only meaningful for a preemptive policy (SRT in this project)
        if (rdyPolicy != SRT)
        {
            throw Exception(ENOTSUP, __func__);
        }

        if (cid >= simProcessorCount)
        {
            throw Exception(EINVAL, __func__);
        }

        // If CPU is idle, nothing to preempt
        if (simProcessorState[cid].idle)
        {
            return;
        }

        uint16_t pid = simProcessorState[cid].pid;

        PctProcessState curState;
        pctGet(pid, PctState, &curState);
        if (curState != RUNNING)
        {
            throw Exception(EPERM, __func__);
        }

        // Find and remove the scheduled event that marks the end of this CPU slice/burst
        // (scheduled by DISPATCH): WAIT_EVENT / EXIT / TIMEOUT for this core.
        FeqNode *prev = nullptr;
        FeqNode *cur = feqHead;
        FeqNode *victimPrev = nullptr;
        FeqNode *victim = nullptr;

        while (cur != nullptr && cur != FEQ_UNDEF_NODE)
        {
            if (cur->xid == cid && (cur->type == WAIT_EVENT || cur->type == EXIT || cur->type == TIMEOUT))
            {
                victimPrev = prev;
                victim = cur;
                break;
            }
            prev = cur;
            cur = cur->next;
        }

        if (victim == nullptr)
        {
            // No scheduled completion event found for this core
            throw Exception(EINVAL, __func__);
        }

        FeqEventType completionType = victim->type;
        double remaining = victim->time - simTime;
        if (remaining < 0)
        {
            remaining = 0;
        }

        // Unlink from FEQ
        if (victimPrev == nullptr)
        {
            feqHead = victim->next;
        }
        else
        {
            victimPrev->next = victim->next;
        }
        delete victim;

        // If there's nothing left to run, let the previously scheduled event happen immediately
        // by re-inserting it at current time.
        if (remaining == 0)
        {
            feqInsert(simTime, completionType, cid);
            return;
        }

        // Rewind job burst index back to the current CPU burst and update its remaining duration
        uint32_t jid;
        pctGet(pid, PctJid, &jid);

        uint32_t nextBurstIndex;
        jobGet(jid, JobNextBurstIndex, &nextBurstIndex);
        if (nextBurstIndex == 0)
        {
            throw Exception(EINVAL, __func__);
        }

        uint32_t curBurstIndex = nextBurstIndex - 1;
        if (curBurstIndex >= JOB_MAX_BURSTS)
        {
            throw Exception(EINVAL, __func__);
        }

        // Update burst duration directly in the job profile
        JobNode *job = jobHead;
        while (job != nullptr && job != JOB_UNDEF_NODE && job->jid < jid)
        {
            job = job->next;
        }
        if (job == nullptr || job == JOB_UNDEF_NODE || job->jid != jid)
        {
            throw Exception(EINVAL, __func__);
        }
        job->bursts[curBurstIndex] = remaining;

        // Make the CPU burst the next one again
        jobSet(jid, JobNextBurstIndex, &curBurstIndex);

        // Move process back to READY and reinsert in RDY with remaining time
        PctProcessState newState = READY;
        pctSet(pid, PctState, &newState);
        rdyInsert(pid, simTime, remaining);

        // Mark CPU idle and append it to the idle list tail (chronological release order)
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

        // Schedule DISPATCH at current time if not already present
        for (FeqNode *n = feqHead; n != nullptr && n != FEQ_UNDEF_NODE; n = n->next)
        {
            if (n->type == DISPATCH && n->time == simTime)
            {
                return;
            }
        }
        feqInsert(simTime, DISPATCH, 0);
    }
} // end of namespace group

