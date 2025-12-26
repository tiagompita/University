/*
 *
 *  Test code for PCT module
 *  \author Ana Santos 120039
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
    banner("Starting the PCT module");
    pctOpen(0x001, 0xfff);

    /* test pctPrint when PCT queue is empty */
    banner("Printing PCT queue in CSV mode");
    pctPrint(stdout, true);
    banner("Printing PCT queue in Normal mode");
    pctPrint(stdout, false);

    // Coisas novas:

    /* test pctNew */
    banner("Creating processes (Filling PCT)");
    uint16_t pid1 = pctNew(0x1001); 
    fprintf(fout, "Created process with PID: %u (Job 0x1001)\n", pid1);

    uint16_t pid2 = pctNew(0x2002);
    fprintf(fout, "Created process with PID: %u (Job 0x2002)\n", pid2);

    uint16_t pid3 = pctNew(0x3003);
    fprintf(fout, "Created process with PID: %u (Job 0x3003)\n", pid3);

    uint16_t pid4 = pctNew(0x4004);
    fprintf(fout, "Created process with PID: %u (Job 0x4004)\n", pid4);

    uint16_t pid5 = pctNew(0x5005);
    fprintf(fout, "Created process with PID: %u (Job 0x5005)\n", pid5);

    uint16_t pid6 = pctNew(0x6006);
    fprintf(fout, "Created process with PID: %u (Job 0x6006)\n", pid6);

    uint16_t pid7 = pctNew(0x7007);
    fprintf(fout, "Created process with PID: %u (Job 0x7007)\n", pid7);
    
    /* test pctSet */
    banner("Setting memaddr and state, and getting them afterwards");

    uint32_t mem1 = 0x1000;
    uint32_t jid2 = 0x2222;
    uint32_t jid3 = 0x3333;

    PctProcessState stateNew = NEW;
    pctSet(pid1, PctState, &stateNew);
    pctSet(pid1, PctMemAddr, &mem1);
    fprintf(fout, "Set PID %u -> State: NEW, Mem: 0x1000\n", pid1);

    PctProcessState stateRunning = RUNNING;
    pctSet(pid2, PctState, &stateRunning);
    pctSet(pid2, PctJid, &jid2);
    fprintf(fout, "Set PID %u -> State: RUNNING, Mem: 0x1000\n", pid2);

    PctProcessState stateBlocked = BLOCKED;
    pctSet(pid3, PctState, &stateBlocked);
    pctSet(pid3, PctJid, &jid3);
    fprintf(fout, "Set PID %u -> State: BLOCKED\n", pid3);

    PctProcessState stateReady = READY;
    pctSet(pid4, PctState, &stateReady);
    fprintf(fout, "Set PID %u -> State: READY\n", pid4);

    PctProcessState stateS_Blocked = S_BLOCKED;
    pctSet(pid5, PctState, &stateS_Blocked);
    fprintf(fout, "Set PID %u -> State: S_BLOCKED\n", pid5);

    PctProcessState stateS_Ready = S_READY;
    pctSet(pid6, PctState, &stateS_Ready);
    fprintf(fout, "Set PID %u -> State: S_READY\n", pid6);

    PctProcessState stateEnded= ENDED;
    uint32_t mem3 = 0x0000;
    pctSet(pid7, PctState, &stateEnded);
    pctSet(pid7, PctMemAddr, &mem3);
    fprintf(fout, "Set PID %u -> State: ENDED, Mem: 0x0000\n", pid7);

    /* test pctPrint PCT queue */
    banner("Printing PCT queue in CSV mode");
    pctPrint(stdout, true);
    banner("Printing PCT queue in Normal mode");
    pctPrint(stdout, false);

    /* test pctGet, getting pid after setting it */
    banner("Getting jid, memaddr and state after setting it");

    uint32_t get_jid;
    uint32_t get_memaddr;
    PctProcessState get_state;

    pctGet(pid1, PctJid, &get_jid);
    pctGet(pid1, PctMemAddr, &get_memaddr);
    pctGet(pid1, PctState, &get_state);

    fprintf(fout, "PID %u -> State: %d (Expected %d), Mem: 0x%x, JID: 0x%x\n",
            pid1, get_state, RUNNING, get_memaddr, get_jid);

    pctGet(pid2, PctState, &get_state);
    fprintf(fout, "PID %u -> State: %d (Expected %d)\n", pid2, get_state, BLOCKED);

    pctGet(pid3, PctJid, &get_jid);
    pctGet(pid3, PctMemAddr, &get_memaddr);
    pctGet(pid3, PctState, &get_state);

    fprintf(fout, "PID %u -> State: %d (Expected %d), Mem: 0x%x, JID: 0x%x\n",
            pid3, get_state, ENDED, get_memaddr, get_jid);

    banner("Deleting PID's from PCT");
    pctDelete(pid1);
    pctDelete(pid2);
    pctDelete(pid3);
    pctDelete(pid4);
    pctDelete(pid5);
    pctDelete(pid6);
    pctDelete(pid7);
    banner("Printing PCT queue in Normal mode, should be empty");
    pctPrint(stdout, false);

    /* end simulation */
    banner("Close and end the PCT module");
    pctClose();

    banner("Bye!");

}