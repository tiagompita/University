/*
 *  \author Daniel Oliveira 115359
 */

#include "somm25nm.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{
    void simPrint(FILE *fout, uint32_t which, bool csv)
    {
        if (csv)
        {
            // CSV format: print processor states
            fprintf(fout, "processor;pid\n");
            for (uint32_t i = 0; i < simProcessorCount; i++)
            {
                fprintf(fout, "%u;", i);
                if (simProcessorState[i].idle)
                {
                    fprintf(fout, "---\n");
                }
                else
                {
                    fprintf(fout, "%u\n", simProcessorState[i].pid);
                }
            }
        }
        else
        {
            // Normal format: print SIM internal state
            fprintf(fout, "\nSIM module internal state:\n");
            for (uint32_t i = 0; i < simProcessorCount; i++)
            {
                fprintf(fout, "  proc[%u]: ", i);
                if (simProcessorState[i].idle)
                {
                    fprintf(fout, "(idle)\n");
                }
                else
                {
                    fprintf(fout, "(PID: %u)\n", simProcessorState[i].pid);
                }
            }
        }
        
        // Print satellite modules if requested
        if (which & SimPrintJob)
        {
            jobPrint(fout, csv);
        }
        
        if (which & SimPrintPct)
        {
            pctPrint(fout, csv);
        }
        
        if (which & SimPrintFeq)
        {
            feqPrint(fout, csv);
        }
        
        if (which & SimPrintRdy)
        {
            rdyPrint(fout, csv);
        }
        
        if (which & SimPrintSwp)
        {
            swpPrint(fout, csv);
        }
        
        // Handle MEM module with different modes
        if (which & SimPrintMemGlobal)
        {
            memPrint(fout, MemPrintGlobal, csv);
        }
        else if (which & SimPrintMemFreeOnly)
        {
            memPrint(fout, MemPrintFree, csv);
        }
        else if (which & SimPrintMemOccupiedOnly)
        {
            memPrint(fout, MemPrintOccupied, csv);
        }
    }
} // end of namespace group

