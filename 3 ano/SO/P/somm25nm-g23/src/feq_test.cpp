/*
 *
 *  Test code for FEQ module
 *  \author Tiago Pita 120152
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
           "  -h             --- print this help\n",
           cmd_name);
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

    printf("Continue (Y/n)? ");
    fflush(stdout);
    while (true)
    {
        int res = getchar();
        if (res == '\n')
            break;
        printf("\n");
        if (res == 'n' or res == 'N')
            return false;
        if (res == 'y' or res == 'Y')
            break;
        printf("Bad option! Continue (Y/n)? ");
        fflush(stdout);
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
        case 'o': // set output file
        {
            outfile = optarg;
            if ((fout = fopen(outfile, "w")) == NULL)
            {
                fprintf(stderr, "%s: Bad argument (\"%s\"): fail opening file.\n", progName, optarg);
                return EXIT_FAILURE;
            }
            break;
        }
        case 'O': /* set probbing file */
        {
            soProbeFile(optarg);
            break;
        }
        case 'P': /* set ID range to probing system */
        {
            uint32_t lower, upper;
            uint32_t cnt = 0;
            if ((sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) or (cnt != strlen(optarg)))
            {
                fprintf(stderr, "%s: Bad argument to '-p' option.\n", progName);
                printUsage(progName);
                return EXIT_FAILURE;
            }
            soProbeSetIDs(lower, upper);
            break;
        }
        case 'A': /* add IDs to probe conf */
        {
            uint32_t lower, upper;
            uint32_t cnt = 0;
            if ((sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) or (cnt != strlen(optarg)))
            {
                fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                printUsage(basename(argv[0]));
                return EXIT_FAILURE;
            }
            soProbeAddIDs(lower, upper);
            break;
        }
        case 'R': /* remove IDs from probe conf */
        {
            uint32_t lower, upper;
            uint32_t cnt = 0;
            if ((sscanf(optarg, "%d-%d %n", &lower, &upper, &cnt) != 2) or (cnt != strlen(optarg)))
            {
                fprintf(stderr, "%s: Bad argument to '-R' option.\n", basename(argv[0]));
                printUsage(basename(argv[0]));
                return EXIT_FAILURE;
            }
            soProbeRemoveIDs(lower, upper);
            break;
        }
        case 'n': // set no pause mode
        {
            pauseSim = noPause;
            break;
        }
        case 'b': // set binary mode
        {
            soBinSetIDs(0, 999);
            break;
        }
        case 'g': // set binary mode
        {
            soBinSetIDs(0, 0);
            break;
        }
        case 'a': /* add IDs to probe conf */
        {
            uint32_t lower, upper;
            uint32_t cnt = 0;
            if ((sscanf(optarg, "%d%*[,-]%d %n", &lower, &upper, &cnt) != 2) or (cnt != strlen(optarg)))
            {
                fprintf(stderr, "%s: Bad argument to '-A' option.\n", basename(argv[0]));
                printUsage(basename(argv[0]));
                return EXIT_FAILURE;
            }
            soBinAddIDs(lower, upper);
            break;
        }
        case 'r': /* remove IDs from probe conf */
        {
            uint32_t lower, upper;
            uint32_t cnt = 0;
            if ((sscanf(optarg, "%d-%d %n", &lower, &upper, &cnt) != 2) or (cnt != strlen(optarg)))
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

    banner("Starting the FEQ module");
    feqOpen();

    banner("Printing FEQ queue in CSV mode (Empty)");
    feqPrint(fout, true);
    banner("Printing FEQ queue in Normal mode (Empty)");
    feqPrint(fout, false);

    banner("Inserting ALL Event Types with timestamps (Unordered)");

    feqInsert(10.0034, SUBMIT, 1);
    feqInsert(5.500858, ADMIT, 2);
    feqInsert(15.000014, DISPATCH, 3);
    feqInsert(2.09, TIMEOUT, 4);
    feqInsert(12.099, PREEMPT, 5);
    feqInsert(8.0, WAIT_EVENT, 6);
    feqInsert(25.0, EVENT_OCCURS, 7);
    feqInsert(3.0, SUSPEND, 8);
    feqInsert(18.0, ACTIVATE, 9);
    feqInsert(30.0, EXIT, 10);
    feqInsert(1.0, DELETE, 11);

    fprintf(fout, "All types inserted with different times.\n");

    banner("Printing FEQ queue (Sorted by Time)");
    feqPrint(fout, false);
    banner("Printing FEQ queue in CSV mode");
    feqPrint(fout, true);

    banner("Retrieving events one by one (feqRetrieve)");
    double time;
    FeqEventType type;
    uint32_t xid;
    int count = 0;

    while (true)
    {
        // Tenta remover (blocking=false)
        bool success = feqRetrieve(&time, &type, &xid, false);

        if (!success) {
            fprintf(fout, "feqRetrieve returned false (Queue Empty)\n");
            break;
        }

        fprintf(fout, "Popped [%d]: Time %5.1f | Type (int) %d | ID %u\n", count++, time, (int)type, xid);
    }

    banner("Testing Tie-Breaking Rules (Same Time)");
    // 1. DISPATCH first
    // 2. WAIT_EVENT, EXIT, TIMEOUT, PREEMPT
    // 3. Others (insertion order)

    double testTime = 50.0;
    fprintf(fout, "Inserting multiple events at Time %.1f to check priority...\n", testTime);

    feqInsert(testTime, SUBMIT, 100);
    feqInsert(testTime, DISPATCH, 101);
    feqInsert(testTime, TIMEOUT, 102);
    feqInsert(testTime, EVENT_OCCURS, 103);
    feqInsert(testTime, EXIT, 104);

    banner("Printing FEQ queue (Sorted by Time)");
    feqPrint(fout, true);

    fprintf(fout, "Events inserted. Retrieving...\n");

    feqRetrieve(&time, &type, &xid);
    fprintf(fout, "1st Pop: Type %d (Expected %d (DISPATCH))\n", type, DISPATCH);

    feqRetrieve(&time, &type, &xid);
    fprintf(fout, "2nd Pop: Type %d (Expected %d or %d (TIMEOUT/EXIT))\n", type, TIMEOUT, EXIT);

    feqRetrieve(&time, &type, &xid);
    fprintf(fout, "3rd Pop: Type %d (Expected %d or %d (TIMEOUT/EXIT))\n", type, TIMEOUT, EXIT);

    feqRetrieve(&time, &type, &xid);
    fprintf(fout, "4th Pop: Type %d (Expected %d (SUBMIT))\n", type, SUBMIT);

    feqRetrieve(&time, &type, &xid);
    fprintf(fout, "5th Pop: Type %d (Expected %d (EVENT_OCCURS))\n", type, EVENT_OCCURS);

    banner("Close and end the FEQ module");
    feqClose();

    banner("Bye!");
}