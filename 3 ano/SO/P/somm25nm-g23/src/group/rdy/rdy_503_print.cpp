/*
 *  \author José Santos 112909
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void rdyPrint(FILE *fout, bool csv)
    {
        if (csv) {
            // CSV header: pid;queueTime;runTime
            fprintf(fout, "pid;queueTime;runTime\n");
            for (RdyNode *current = rdyHead; current != nullptr; current = current->next) {
                // pid without zero-padding, times with one decimal
                fprintf(fout, "%u;%.1f;%.1f\n", current->pid, current->queueTime, current->runTime);
            }
        }
        else {
            // Human-readable format (match binary output)
            fprintf(fout, "\nRDY module internal state:\n");

            // If empty, print (empty)
            if (rdyHead == nullptr) {
                fprintf(fout, "  (empty)\n");
                return;
            }

            for (RdyNode *current = rdyHead; current != nullptr; current = current->next) {
                // Single-line entry matching expected format
                fprintf(fout, "  PID: %u;   queue time: %.1f;   burst time: %.1f\n",
                        current->pid, current->queueTime, current->runTime);
            }
        }
    }
} // end of namespace group


