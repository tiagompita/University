/*
 *  \author Francisco Pires 112694
 */

#include "mem.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void memPrint(FILE *fout, MemPrintMode mode, bool csv)
    {
        if (csv) {
            // CSV format: print all blocks with pid column
            fprintf(fout, "index;address;size;pid\n");
            for (uint32_t i = 0; i < memBlockCount; i++) {
                fprintf(fout, "%u;0x%x;0x%x;%u\n", i, memBlocks[i].addr, 1 << memBlocks[i].logSize, memBlocks[i].pid);
            }
        } else {
            // Normal format
            switch (mode) {
                case MemPrintGlobal:
                    fprintf(fout, "\nMEM module internal state: all blocks (%u):\n", memBlockCount);
                    for (uint32_t i = 0; i < memBlockCount; i++) {
                        fprintf(fout, "  block[%u]: addr: 0x%x; size: 0x%x; PID: ", 
                                i, memBlocks[i].addr, 1 << memBlocks[i].logSize);
                        if (memBlocks[i].pid == 0) {
                            fprintf(fout, "(none)\n");
                        } else {
                            fprintf(fout, "%u\n", memBlocks[i].pid);
                        }
                    }
                    break;
                
                case MemPrintFree:
                    fprintf(fout, "\nMEM module internal state: only free blocks:\n");
                    for (uint32_t i = 0; i < memBlockCount; i++) {
                        if (memBlocks[i].pid == 0) {  // Free block
                            fprintf(fout, "  block[%u]: addr: 0x%x; size: 0x%x\n", 
                                    i, memBlocks[i].addr, 1 << memBlocks[i].logSize);
                        }
                    }
                    break;
                
                case MemPrintOccupied:
                    fprintf(fout, "\nMEM module internal state: only occupied blocks:\n");
                    for (uint32_t i = 0; i < memBlockCount; i++) {
                        if (memBlocks[i].pid != 0) {  // Occupied block
                            fprintf(fout, "  block[%u]: addr: 0x%x; size: 0x%x; PID: %u\n", 
                                    i, memBlocks[i].addr, 1 << memBlocks[i].logSize, memBlocks[i].pid);
                        }
                    }
                    break;
            }
        }
    }
} // end of namespace group


