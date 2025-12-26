/*
 *  \author Tiago Pita 120152
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{
    void jobSet(uint32_t jid, JobField field, void *value)
    {

        JobNode *current = jobHead;
        
        if (current == JOB_UNDEF_NODE) {
            throw Exception(EINVAL, __func__);
        }

        while (current != NULL) {
            
            if (current->jid == jid) {
                break;
            }

            if (current->jid > jid) {
                current = NULL;
                break;
            }

            current = current->next;
        }

        if (current == NULL) {
            throw Exception(EINVAL, __func__);
        }

        
        switch (field)
        {
        case JobFinishTime:
            current->finishTime = *((double *)value);
            break;
        case JobNextBurstIndex:
            current->nextBurstIndex = *((uint32_t *)value);
            break;

        // Exception EACCES must be thrown in case a not settable field is given
        case JobSubmissionTime:
        case JobMemSize:
        case JobNextBurstDuration:
            throw Exception(EACCES, __func__);
            break;

        default:
            throw Exception(EINVAL, __func__);
        }
    }

} // end of namespace somm25nm
