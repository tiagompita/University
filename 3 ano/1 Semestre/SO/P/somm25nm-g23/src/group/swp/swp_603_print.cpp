/*
 *  \author Rafael Caçador 107370
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpPrint(FILE *fout, bool csv)
    {
        // Check if module is open
        if (swpHead == SWP_UNDEF_NODE) {
            throw Exception(EINVAL, __func__);
        }
        
        if (csv) {
            // CSV header: pid;size;blocked
            fprintf(fout, "pid;size;blocked\n");
            
            for (SwpNode *current = swpHead; current != nullptr; current = current->next) {
                // Format: pid;size;yes/no for blocked
                fprintf(fout, "%u;%u;%s\n", 
                        current->pid, 
                        current->size, 
                        current->blocked ? "yes" : "no");
            }   
        }
        else {
            // Human-readable format
            fprintf(fout, "\nSWP module internal state:\n");

            // If empty, print (empty)
            if (swpHead == nullptr) {
                fprintf(fout, "  (empty)\n");
                return;
            }

            for (SwpNode *current = swpHead; current != nullptr; current = current->next) {
                // Format: PID: X;  size: Y/0xHEX;  state: SUSPENDED_READY/SUSPENDED_BLOCKED
                fprintf(fout, "  PID: %u;  size: %u/0x%x;  state: %s\n",
                        current->pid, 
                        current->size,
                        current->size,  // size in hexadecimal
                        current->blocked ? "SUSPENDED_BLOCKED" : "SUSPENDED_READY");
            }
        }
    }
} // end of namespace group