/*
 *  
 *  Test code for MEM module
 *  \author Daniel Oliveira 115359
 *
 *  \author Artur Pereira - 2025
 */

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <libgen.h>
#include <termios.h>

#include <string>
#include <iostream>
#include <map>

#include "exception.h"

#include "somm25nm.h"


/* ******************************************** */
/* print help message */
static void printUsage(const char *cmd_name)
{
    printf("Sinopsis: %s [OPTIONS]\n"
           "  OPTIONS:\n"
           "  -i infile      --- set input file (default: stdin)\n"
           "  -o outfile     --- set log file (default: stdout)\n"
           "  -O outfile     --- set probbing file (default: stdout)\n"
           "  -P num-num     --- set probe ID range (default: 0-0)\n"
           "  -A num-num     --- add range of IDs to probe configuration\n"
           "  -R num-num     --- remove range of IDs from probe configuration\n"
           "  -b             --- set bin selection map to 100-799\n"
           "  -g             --- set bin selection map to 0-0 (default)\n"
           "  -a num-num     --- add range of IDs to bin selection map\n"
           "  -r num-num     --- remove range of IDs from bin selection map\n"
           "  -n             --- run without pause (default: pause)\n"
           "  -h             --- print this help\n", cmd_name);
}

bool noPause()
{
   return true;
}

bool termPause()
{
    static bool firstTime = true;
    static struct termios prev, cur;
    if (firstTime)
    {
        firstTime = false;
        tcgetattr(STDIN_FILENO, &prev);
        cur = prev;
        cur.c_lflag &= (~ICANON);
        tcsetattr(STDIN_FILENO, TCSANOW, &cur);
    }

    printf("Continue (Y/n)? "); fflush(stdout);
    while (true)
    {
        int res = getchar();
        if (res == '\n') break;
        printf("\n");
        if (res == 'n' or res == 'N') return false;
        if (res == 'y' or res == 'Y') break;
        printf("Bad option! Continue (Y/n)? "); fflush(stdout);
    }
    return true;
}

bool (*pauseSim)(void) = termPause;

void banner(const char *msg)
{
    fprintf(stdout, "\n\e[33;1m%s\e[0m\n\n", msg);
}

/* ******************************************** */
/* The main function */
int main(int argc, char *argv[])
{
    const char *progName = basename(argv[0]); 

    /* by default, send probing to stdout */
    FILE *fout = stdout;
    soProbeOpen(stdout, 0, 0);

    /* default values for command line options */
    const char *infile = NULL;
    (void)infile; // to avoid warning
    const char *outfile = NULL;
    (void)outfile; // to avoid warning

    /* process command line options */
    int opt;
    while ((opt = getopt(argc, argv, "i:o:O:P:A:R:nbga:r:h")) != -1)
    {
        switch (opt)
        {
            case 'i':
            {
                infile = optarg;
                break;
            }
            case 'o':          // set output file
            {
                outfile = optarg;
                if ((fout = fopen(outfile, "w")) == NULL)
                {
                    fprintf(stderr, "%s: Bad argument (\"%s\"): fail opening file.\n", progName, optarg);
                    return EXIT_FAILURE;
                }
                break;
            }
            case 'O':          /* set probbing file */
            {
                soProbeFile(optarg);
                break;
            }
            case 'P':          /* set ID range to probing system */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-p' option.\n", progName);
                    printUsage(progName);
                    return EXIT_FAILURE;
                }
                soProbeSetIDs(lower, upper);
                break;
            }
            case 'A':          /* add IDs to probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soProbeAddIDs(lower, upper);
                break;
            }
            case 'R':          /* remove IDs from probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d-%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-R' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soProbeRemoveIDs(lower, upper);
                break;
            }
            case 'n':    // set no pause mode
            {
                pauseSim = noPause;
                break;
            }
            case 'b':  // set binary mode
            {
                soBinSetIDs(0, 999);
                break;
            }
            case 'g':  // set binary mode
            {
                soBinSetIDs(0, 0);
                break;
            }
            case 'a':          /* add IDs to probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soBinAddIDs(lower, upper);
                break;
            }
            case 'r':          /* remove IDs from probe conf */
            {
                uint32_t lower, upper;
                uint32_t cnt = 0;
                if ( (sscanf(optarg, "%d-%d %n", &lower, &upper, &cnt) != 2) 
                        or (cnt != strlen(optarg)) )
                {
                    fprintf(stderr, "%s: Bad argument to '-R' option.\n", basename(argv[0]));
                    printUsage(basename(argv[0]));
                    return EXIT_FAILURE;
                }
                soBinRemoveIDs(lower, upper);
                break;
            }
            case 'h':
            {
                printUsage(progName);
                return 0;
            }
            default:
            {
                fprintf(stderr, "%s: Wrong option (\"-%c\".\n", progName, opt);
                printUsage(progName);
                return EXIT_FAILURE;
            }
        }
    }

    /* set fout stream as no buffered */
    setvbuf(fout, NULL, _IONBF, 0);

    /* init test */
    banner("Starting the MEM module");
    // exemplo de configuração:
    // sizes[0] = 2  -> 2 blocos de 1024
    // sizes[1] = 1  -> 1 bloco de 2048
    // sizes[2] = 1  -> 1 bloco de 4096
    uint32_t sizes[3] = {2, 1, 1};
    uint32_t cnt = sizeof(sizes) / sizeof(sizes[0]);
    uint32_t initAddr = 0x10000000;

    try
    {
        memOpen(initAddr, 10, sizes, cnt);

        /* print test, estado inicial */
        banner("Printing MEM state (initial) - GLOBAL (every block) - normal");
        memPrint(fout, MemPrintGlobal, false);
        memPrint(fout, MemPrintGlobal, true);

        banner("Printing MEM state (initial) - FREE (free blocks only) - CSV");
        memPrint(fout, MemPrintFree, false);
        memPrint(fout, MemPrintGlobal, true);

        banner("Printing MEM state (initial) - OCCUPIED (occupied blocks only) - normal (should be empty)");
        memPrint(fout, MemPrintOccupied, false);
        memPrint(fout, MemPrintGlobal, true);

        /* alloc test */
        banner("Allocating some memory blocks");
        uint32_t addr1, addr2, addr3, addr4;

        addr1 = memAlloc(1, 1500); // processo 1 pede 1500 bytes
        fprintf(fout, "Process 1 allocated at addr: %#x\n", addr1);

        addr2 = memAlloc(2, 1024); // processo 2 pede exatamente 1024 bytes
        fprintf(fout, "Process 2 allocated at addr: %#x\n", addr2);

        addr3 = memAlloc(3, 3000); // processo 3 pede 3000 bytes
        fprintf(fout, "Process 3 allocated at addr: %#x\n", addr3);

        addr4 = memAlloc(4, 5000); // processo 4 pede 5000 bytes
        fprintf(fout, "Process 4 allocated at addr: %#x\n", addr4);
        if (addr4 != 0) {
            fprintf(fout, "\e[31mFAIL: Should have returned 0 for unavailable size.\e[0m\n");
        } else {
            fprintf(fout, "\e[32mSUCCESS: Correctly returned 0 for unavailable size.\e[0m\n");
        }

        banner("Printing MEM state after allocations - OCCUPIED (occupied blocks only) - normal");
        memPrint(fout, MemPrintOccupied, false);

        /* biggestFreeBlock test */
        banner("Checking size of biggest free block");
        uint32_t biggestBlock = memBiggestFreeBlock();
        fprintf(fout, "Biggest free block size: %u bytes\n", biggestBlock);
        if (biggestBlock != 1024) fprintf(fout, "\e[31mFAIL: Calculation incorrect.\e[0m\n");

        ///////////////////////////////////////////////////

        banner("Robustness Test: Freeing invalid address");
        try {
            memFree(0x0); // Endereço nulo
            fprintf(fout, "\e[31mFAIL: memFree(0x0) should throw exception.\e[0m\n");
        } catch (const Exception &e) {
            fprintf(fout, "\e[32mSUCCESS: Caught expected exception: %s\e[0m\n", e.what());
        }

        try {
            memFree(0x99999999); // Endereço inexistente
            fprintf(fout, "\e[31mFAIL: memFree(random) should throw exception.\e[0m\n");
        } catch (const Exception &e) {
            fprintf(fout, "\e[32mSUCCESS: Caught expected exception: %s\e[0m\n", e.what());
        }

        ///////////////////////////////////////////////////

        /* free test */
        banner("Freeing one allocated block and printing MEM state afterwards");
        if (addr2 != 0)
        {
            memFree(addr2);
            fprintf(fout, "Freed block at addr: %#x (Process 2)\n", addr2);
        }
        else
        {
            fprintf(fout, "No block to free for process 2\n");
        }

        banner("MEM state after freeing one block - GLOBAL (every block) - normal");
        memPrint(fout, MemPrintGlobal, false);

        biggestBlock = memBiggestFreeBlock();
        fprintf(fout, "Biggest free block size after freeing: %u bytes\n", biggestBlock);

        /* closing MEM module */
        banner("Freeing remaining blocks");
        if (addr1 != 0)
        {
            memFree(addr1);
            fprintf(fout, "Freed block at addr: %#x (Process 1)\n", addr1);
        }
        if (addr3 != 0)
        {
            memFree(addr3);
            fprintf(fout, "Freed block at addr: %#x (Process 3)\n", addr3);
        }

        banner("Printing final MEM state - GLOBAL (every block) - normal (should be all free)");
        memPrint(fout, MemPrintGlobal, false);

        banner("Closing the MEM module");
        memClose();

    } catch (const Exception &e) {
        fprintf(fout, "\n\e[31;1mFATAL ERROR UNCAUGHT:\e[0m %s\n", e.what());
        return EXIT_FAILURE;
    }
    

    banner("Bye!");
}
