/*
 *  \author Ana Santos 120039
 */

#include "pct.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{
    void pctPrint(FILE *fout, bool csv)
    {
        if (csv){
            fprintf(fout, "pid;jid;memAddr;state\n");
    
            for (uint16_t i = 0; i < pctPidCount; i++){
                if (pctTable[i] != nullptr){
                    uint16_t pid = pctPidBase + i;
                    fprintf(fout, "%05u;%08x;", pid, pctTable[i]->jid);
                    
                    if (pctTable[i]->memAddr == 0)
                        fprintf(fout, "0;");
                    else if (pctTable[i]->memAddr == PCT_UNDEF_ADDRESS)
                        fprintf(fout, "UNDEF;");
                    else
                        fprintf(fout, "0x%x;", pctTable[i]->memAddr);

                    switch (pctTable[i]->state){
                        case NEW: fprintf(fout, "NEW\n"); break;
                        case RUNNING: fprintf(fout, "RUNNING\n"); break;
                        case BLOCKED: fprintf(fout, "BLOCKED\n"); break;
                        case READY: fprintf(fout, "READY\n"); break;
                        case S_BLOCKED: fprintf(fout, "SUSPENDED_BLOCKED\n"); break;
                        case S_READY: fprintf(fout, "SUSPENDED_READY\n"); break;
                        case ENDED: fprintf(fout, "ENDED\n"); break;
                        default: fprintf(fout, "UNDEF\n"); break;
                    }
                }
            }
        }
        else{
            // Human-readable format
            fprintf(fout, "\nPCT module internal state:\n");
            // If PCT empty print (empty)
            bool isEmpty = true;
            for (uint16_t i = 0; i < pctPidCount; i++){
                if (pctTable[i] != nullptr){
                    isEmpty = false;
                    break;
                }
            }
            if (isEmpty){
                fprintf(fout, "  (empty)\n");
            }

            for (uint16_t i = 0; i < pctPidCount; i++){
                if (pctTable[i] != nullptr){
                    uint16_t pid = pctPidBase + i;
                    fprintf(fout, "PID: %u\n", pid);
                    fprintf(fout, "  Job ID: 0x%08x\n", pctTable[i]->jid);
                    
                    fprintf(fout, "  Memory address: ");
                    if (pctTable[i]->memAddr == 0)
                        fprintf(fout, "0\n");
                    else if (pctTable[i]->memAddr == PCT_UNDEF_ADDRESS)
                        fprintf(fout, "UNDEF\n");
                    else
                        fprintf(fout, "0x%x\n", pctTable[i]->memAddr);

                    fprintf(fout, "  State: ");
                    switch (pctTable[i]->state){
                        case NEW: fprintf(fout, "NEW\n"); break;
                        case RUNNING: fprintf(fout, "RUNNING\n"); break;
                        case BLOCKED: fprintf(fout, "BLOCKED\n"); break;
                        case READY: fprintf(fout, "READY\n"); break;
                        case S_BLOCKED: fprintf(fout, "SUSPENDED_BLOCKED\n"); break;
                        case S_READY: fprintf(fout, "SUSPENDED_READY\n"); break;
                        case ENDED: fprintf(fout, "ENDED\n"); break;
                        default: fprintf(fout, "UNDEF\n"); break;
                    }
                }
            }
        }
    }

} // end of namespace group

