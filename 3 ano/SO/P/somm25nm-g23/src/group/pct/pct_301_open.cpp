/*
 *  \author José Santos 112909
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{
    void pctOpen(uint16_t base, uint16_t cnt)
    {
        pctPidBase = base;
        pctPidCount = cnt;

        try{
            pctTable = new PctNode*[cnt];
        }
        catch(...)
        {
            throw Exception(errno, __func__);
        }

        for (uint16_t i = 0; i < cnt; i++)
            pctTable[i] = nullptr;

        pctLastPid = static_cast<uint16_t>( (uint32_t)(pctPidBase - 1u) + (uint32_t)pctPidCount );
    }
} // end of namespace group

