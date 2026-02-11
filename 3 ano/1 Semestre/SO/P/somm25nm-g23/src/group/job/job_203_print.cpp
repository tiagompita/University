/*
 *  \author Daniel Oliveira 115359
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{

// ================================================================================== //

    void jobPrint(FILE *fout, bool csv)
    {
        if (csv)
        {
            // CSV format with semi-colon separator
            fprintf(fout, "jid;submissionTime;finishTime;memSize;nextBurstIndex;profile\n");
            
            for (JobNode *current = jobHead; current != nullptr; current = current->next)
            {
                fprintf(fout, "%x;%.1f;", current->jid, current->submissionTime);
                
                // Handle finishTime (check for undefined value)
                if (current->finishTime == JOB_UNDEF_TIME)
                    fprintf(fout, "UNDEF;");
                else
                    fprintf(fout, "%.1f;", current->finishTime);
                
                fprintf(fout, "0x%x;%u;", current->memSize, current->nextBurstIndex);
                
                // Print bursts - including zeros and negative values
                bool first = true;
                for (int i = 0; i < JOB_MAX_BURSTS; i++)
                {
                    if (current->bursts[i] != 0.0)
                    {
                        if (!first)
                            fprintf(fout, ",");
                        fprintf(fout, "%.1f", current->bursts[i]);
                        first = false;
                    }
                }
                fprintf(fout, "\n");
            }
        }
        else
        {
            // Human-readable format
            fprintf(fout, "\nJOB module internal state:\n");
            // If job empty print (empty)
            JobNode *current = jobHead;
            if (current == nullptr)
            {
                fprintf(fout, "  (empty)\n");
            }
            for (JobNode *current = jobHead; current != nullptr; current = current->next)
            {
                fprintf(fout, "JOB: 0x%08x\n", current->jid);
                fprintf(fout, "  Submission time: %.1f\n", current->submissionTime);
                
                // Handle finishTime (check for undefined value)
                if (current->finishTime == JOB_UNDEF_TIME)
                    fprintf(fout, "  Finish time: UNDEF\n");
                else
                    fprintf(fout, "  Finish time: %.1f\n", current->finishTime);
                
                fprintf(fout, "  Memory size: %u/0x%x\n", current->memSize, current->memSize);
                fprintf(fout, "  Next burst index: %u\n", current->nextBurstIndex);
                fprintf(fout, "  Burst profile: ");
                
                bool first = true;
                for (int i = 0; i < JOB_MAX_BURSTS; i++)
                {
                    if (current->bursts[i] != 0.0)
                    {
                        if (!first)
                            fprintf(fout, ", ");
                        fprintf(fout, "%.1f", current->bursts[i]);
                        first = false;
                    }
                }
                fprintf(fout, "\n");
            }
        }
    }

// ================================================================================== //

} // end of namespace group

