/*
 *  \author Tiago Pita 120152
 */

#include "somm25nm.h"

namespace group
{
    void simStepSubmit(uint32_t jid)
    {
        uint16_t pid = pctNew(jid);
        feqInsert(simTime, ADMIT, pid);

        /* try
        {
            uint16_t pid = pctNew(jid);
            feqInsert(simTime, ADMIT, pid);
        }
        catch (const Exception &e)
        {
            if (e.en == ENOSPC || e.en == EAGAIN)
            {
                double finishTime = simTime;
                jobSet(jid, JobFinishTime, &finishTime);
                return;
            }
            throw;
        } */
    }
} // end of namespace group

