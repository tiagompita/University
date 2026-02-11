/*
 *
 *  Test code for RDY module
 *  \author Daniel Oliveira 115359
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

    try
    {
        banner("TEST 1: SPN Policy (Sorting Check)");

        rdyOpen(SPN);

        banner("Inserting processes (Unordered by burst)");
        rdyInsert(1, 0.0, 5.0);
        rdyInsert(2, 1.0, 3.0);
        rdyInsert(3, 2.0, 8.0);
        rdyInsert(4, 3.0, 1.0); 
        rdyInsert(5, 4.0, 4.0);
        rdyInsert(6, 5.0, 6.0);
        rdyInsert(7, 6.0, 2.0);

        banner("Printing RDY queue in CSV mode (empty)");
        rdyPrint(stdout, true);
        banner("Printing RDY queue in normal mode (empty)");
        rdyPrint(stdout, false);

        banner("Retrieving processes (SPN should respect list order)");
        double curTime = 10.0;

        while (true)
        {
            uint16_t pid = rdyRetrieve(curTime);
            if (pid == 0)
                break;
            fprintf(fout, "Popped: PID %u\n", pid);
        }

        rdyClose();

        banner("TEST 2: HRRN Policy (Response Ratio Check)");

        rdyOpen(HRRN);

        // Cenario para testar HRRN:
        // P8: Chega em T=0, Burst=10  seria último no SPN
        // P9: Chega em T=10, Burst=2  seria primeiro no SPN

        rdyInsert(8, 0.0, 10.0);
        rdyInsert(9, 10.0, 2.0);
        rdyInsert(10, 20.0, 4.0);
        rdyInsert(11, 40.0, 2.0);
        rdyInsert(12, 60.0, 10.0);
        rdyInsert(13, 80.0, 5.0);
        
        banner("Printing RDY queue (sorted by Burst)");
        rdyPrint(fout, false);
        
        // Simulamos que estamos no tempo 100.
        // Calculo do Ratio (R = (W + S) / S) -> (Wait + Service) / Service
        // P8: Wait = 100 - 0 = 100. Ratio = (100 + 10)/10 = 11.0
        // P9: Wait = 100 - 10 = 90. Ratio = (90 + 2)/2 = 46.0
        // Neste caso, P9 (Ratio 46) ganha ao P8 (Ratio 11).

        // P10: T= 20, Burst 4.   W=80.  R=(80+4)/4    = 21.0
        // P11: T= 40, Burst 2.   W=60.  R=(60+2)/2    = 31.0
        // P12: T= 60, Burst 10.  W=40.  R=(40+10)/10  = 5.0
        // P13: T= 80, Burst 5.   W=20.  R=(20+5)/5    = 5.0

        // O HRRN favorece processos curtos, mas impede 
        // starvation (nunca executam se houver sempre processos curtos a chegar)

        banner("Retrieving processes (HRRN) (sorted by Response Ratio)");
        curTime = 100.0;

        while (true)
        {
            uint16_t pid = rdyRetrieve(curTime);
            if (pid == 0)
                break;
            fprintf(fout, "Popped: PID %u at time %.1f\n", pid, curTime);
        }

        rdyClose();
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\n\e[31;1mFATAL ERROR:\e[0m %s\n", e.what());
        return EXIT_FAILURE;
    }
    

    banner("Bye!");
}