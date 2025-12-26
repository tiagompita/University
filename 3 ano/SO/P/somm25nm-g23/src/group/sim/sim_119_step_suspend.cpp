/*
 *  \author Rafael Caçador 107370
 */

#include "somm25nm.h"

namespace group
{
    void simStepSuspend(uint16_t pid)
    {
        PctProcessState curState;
        pctGet(pid, PctState, &curState);

        if (curState == RUNNING)
            throw Exception(EPERM, __func__);
        if (curState == S_READY || curState == S_BLOCKED)
            throw Exception(EPERM, __func__);

        bool blocked = (curState == BLOCKED);

        uint32_t jid;
        pctGet(pid, PctJid, &jid);

        uint32_t memSize;
        jobGet(jid, JobMemSize, &memSize);

        uint32_t memAddr;
        pctGet(pid, PctMemAddr, &memAddr);
        if (memAddr != PCT_UNDEF_ADDRESS)
        {
            memFree(memAddr);
            uint32_t undefAddr = PCT_UNDEF_ADDRESS;
            pctSet(pid, PctMemAddr, &undefAddr);
        }

        PctProcessState newState = blocked ? S_BLOCKED : S_READY;
        pctSet(pid, PctState, &newState);

        swpInsert(pid, memSize, blocked);
    }
} // end of namespace group

