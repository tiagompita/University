/*
 *  Test code for SWP module
 *  \author José Santos 112909
 *  
 *  Adapted from job_test.cpp
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

#include "somm25nm.h"
#include "exception.h"


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

    try
    {
        /* init test */
        banner("Starting the SWP module with FirstFit policy");
        swpOpen(FirstFit);

        banner("Printing SWP queue in CSV mode (empty)");
        swpPrint(stdout, true);
        banner("Printing SWP queue in normal mode (empty)");
        swpPrint(stdout, false);

        banner("Inserting swapped processes");
        // pid, size, blocked
        swpInsert(101, 1000, false);
        swpInsert(102, 500, true);
        swpInsert(103, 2000, false);
        swpInsert(104, 1500, true);
        swpInsert(105, 700, false);

        banner("Printing SWP queue in CSV mode");
        swpPrint(stdout, true);
        banner("Printing SWP queue in normal mode");
        swpPrint(stdout, false);

        banner("Attempting retrieves (sizeAvailable, canBeBlocked)");
        uint16_t pid;

        pid = swpRetrieve(600, false);
        fprintf(fout, "Retrieved (600,false): PID %u\n", pid);

        pid = swpRetrieve(1200, false);
        fprintf(fout, "Retrieved (1200,false): PID %u\n", pid);

        pid = swpRetrieve(2000, true);
        fprintf(fout, "Retrieved (2000,true): PID %u\n", pid);

        banner("Printing SWP queue after retrieves");
        swpPrint(stdout, false);

        banner("Unblocking process 104 and printing");
        swpUnblock(104);
        swpPrint(stdout, false);

        banner("Closing SWP module");
        swpClose();

        //////////////////////////////////////////////////////

        banner("Starting SWP module with FirstBest policy");
        swpOpen(FirstBest);

        fprintf(fout, "Inserting processes for Best Fit scenario...\n");
        
        swpInsert(201, 200, false);
        swpInsert(202, 900, false);
        swpInsert(203, 500, false);

        swpPrint(stdout, false);

        pid = swpRetrieve(1000, false);
        fprintf(fout, "Retrieved (1000,false): PID %u (Expected id 202)\n", pid);

        if (pid == 201)
            fprintf(fout, "\e[31mFAIL: Logic acted as FirstFit (picked 201).\e[0m\n");
        else if (pid == 202)
            fprintf(fout, "\e[32mSUCCESS: Logic acted as FirstBest (picked 202).\e[0m\n");
        else
            fprintf(fout, "\e[31mFAIL: Picked unexpected PID %u\e[0m\n", pid);

        swpClose();

        //////////////////////////////////////////////////////

        banner("Testing Robustness (Unblocking invalid PID)");
        swpOpen(FirstFit);
        swpInsert(301, 100, true);

        try {
            fprintf(fout, "Attempting to unblock non-existent PID 999...\n");
            swpUnblock(999);
            fprintf(fout, "\e[31mFAIL: Should have thrown exception.\e[0m\n");
        } catch (const Exception &e) {
            fprintf(fout, "\e[32mSUCCESS: Caught expected exception: %s\e[0m\n", e.what());
        }

        swpClose();
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\n\e[31;1mFATAL ERROR:\e[0m %s\n", e.what());
        return EXIT_FAILURE;
    }

    banner("Bye!");
}
