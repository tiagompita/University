/*
 *  \author José Santos 112909
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>
#include <cmath>

namespace group
{
    void jobGet(uint32_t jid, JobField field, void *value)
    {
        JobNode *current = jobHead;

        if (current == JOB_UNDEF_NODE) {
            throw Exception(EINVAL, __func__);
        }

        while (current != nullptr) {
            if (current->jid == jid) {
                break;
            }

            if (current->jid > jid) {
                current = nullptr;
                break;
            }

            current = current->next;
        }

        if (current == nullptr) {
            throw Exception(EINVAL, __func__);
        }

        switch (field)
        {
        case JobSubmissionTime:
            *((double *)value) = current->submissionTime;
            break;
        case JobFinishTime:
            *((double *)value) = current->finishTime;
            break;
        case JobMemSize:
            *((uint32_t *)value) = current->memSize;
            break;
        case JobNextBurstIndex:
            *((uint32_t *)value) = current->nextBurstIndex;
            break;
        case JobNextBurstDuration:
        {
            uint32_t idx = current->nextBurstIndex;
            double out = 0.0;
            if (idx < JOB_MAX_BURSTS) {
                out = current->bursts[idx];
                // Find the last non-zero burst to determine if current is the last
                if (out != 0.0) {
                    int lastIdx = -1;
                    for (int i = JOB_MAX_BURSTS - 1; i >= 0; i--) {
                        if (current->bursts[i] != 0.0) {
                            lastIdx = i;
                            break;
                        }
                    }
                    // If current index is the last burst, make it negative
                    if ((int)idx == lastIdx) {
                        out = fabs(out) * -1.0;
                    }
                }
            }
            *((double *)value) = out;
        }
            break;
        default:
            throw Exception(EINVAL, __func__);
        }
    }

} // end of namespace group
