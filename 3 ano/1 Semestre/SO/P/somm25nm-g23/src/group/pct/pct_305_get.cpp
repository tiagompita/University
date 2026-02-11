/*
 *  \author Francisco Pires 112694
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void pctGet(uint16_t pid, PctField field, void *value)
    {
        // Check if module is open
        if (pctTable == PCT_UNDEF_TABLE)
            throw Exception(EINVAL, __func__);
        
        // Check if PID is valid
        if (pid < pctPidBase || pid >= (pctPidBase + pctPidCount))
            throw Exception(EINVAL, __func__);
        
        // Calculate array index
        uint16_t index = pid - pctPidBase;
        
        // Get node and check if it exists
        PctNode *node = pctTable[index];
        if (node == nullptr)
            throw Exception(EINVAL, __func__);
        
        // Copy the requested field to the output parameter
        switch (field)
        {
            case PctJid:
                *((uint32_t *)value) = node->jid;
                break;
            
            case PctMemAddr:
                *((uint32_t *)value) = node->memAddr;
                break;
            
            case PctState:
                *((PctProcessState *)value) = node->state;
                break;
            
            default:
                throw Exception(EINVAL, __func__);
        }
    }
} // end of namespace group
