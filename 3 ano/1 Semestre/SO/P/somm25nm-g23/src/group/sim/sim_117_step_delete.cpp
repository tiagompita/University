/*
 *  \author Rafael Caçador 107370
 */

#include "somm25nm.h"

namespace group
{
    void simStepDelete(uint16_t pid)
    {
        // the process must be removed from the set of active processes.
        //
        //  - releasing its memory block if any
        //  - removing it from RDY/SWP queues if present
        //  - freeing the processor if it is currently running
        //  - deleting its PCT entry

        // If PID does not exist, pctGet will throw EINVAL (keep the behavior).
        PctProcessState st;
        pctGet(pid, PctState, &st);

        // If the process is running, release the associated processor/core.
        for (uint16_t cid = 0; cid < simProcessorCount; cid++)
        {
            if (!simProcessorState[cid].idle && simProcessorState[cid].pid == pid)
            {
                // Append core to idle list tail (chronological order of release)
                if (simIdleTail == simProcessorCount)
                {
                    simIdleHead = cid;
                }
                else
                {
                    simProcessorState[simIdleTail].next = cid;
                }
                simProcessorState[cid].idle = true;
                simProcessorState[cid].next = simProcessorCount;
                simIdleTail = cid;
                break;
            }
        }

        // Release memory block if it was allocated.
        uint32_t memAddr;
        pctGet(pid, PctMemAddr, &memAddr);
        if (memAddr != PCT_UNDEF_ADDRESS && memAddr != 0)
        {
            try
            {
                memFree(memAddr);
            }
            catch (const Exception &e)
            {
                // If the block is already free/not found, ignore; deletion must proceed.
                if (e.en != EINVAL)
                    throw;
            }
        }

        // Remove from RDY queue if present.
        {
            RdyNode *cur = rdyHead;
            RdyNode *prev = nullptr;
            while (cur != nullptr)
            {
                if (cur->pid == pid)
                {
                    if (prev == nullptr)
                        rdyHead = cur->next;
                    else
                        prev->next = cur->next;
                    delete cur;
                    break;
                }
                prev = cur;
                cur = cur->next;
            }
        }

        // Remove from SWP queue if present.
        {
            SwpNode *cur = swpHead;
            SwpNode *prev = nullptr;
            while (cur != nullptr)
            {
                if (cur->pid == pid)
                {
                    if (prev == nullptr)
                        swpHead = cur->next;
                    else
                        prev->next = cur->next;

                    if (cur == swpTail)
                        swpTail = prev;

                    delete cur;
                    break;
                }
                prev = cur;
                cur = cur->next;
            }
        }

        // Finally, remove process from PCT.
        pctDelete(pid);
    }
} // end of namespace group

