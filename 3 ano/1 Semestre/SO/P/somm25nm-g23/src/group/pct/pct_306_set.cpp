/*
 *  \author Tiago Pita 120152
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void pctSet(uint16_t pid, PctField field, void *value)
    {
        // check for uninitialized table
        if (pctTable == PCT_UNDEF_TABLE) {
            throw Exception(EINVAL, __func__);
        }

        // check for valid pid
        if (pid < pctPidBase || pid >= (pctPidBase + pctPidCount)) {
            throw Exception(EINVAL, __func__);
        }

        uint16_t index = pid - pctPidBase;

        PctNode *current = pctTable[index];

        // check if process exists
        if (current == NULL)
        {
            throw Exception(EINVAL, __func__);
        }

        switch (field)
        {
        case PctJid:
            current->jid = *((uint32_t *)value);
            break;

        case PctMemAddr:
            current->memAddr = *((uint32_t *)value);
            break;

        case PctState:
            current->state = *((PctProcessState *)value);
            break;

        default:
            throw Exception(EINVAL, __func__);
        }
    }
} // end of namespace group
