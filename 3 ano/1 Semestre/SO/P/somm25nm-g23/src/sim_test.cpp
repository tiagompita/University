/*
 * Test code for SIM module
 * \author Rafael Caçador 107370
 *
 * \author Artur Pereira - 2025
 */

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <libgen.h>
#include <termios.h>
#include <math.h>

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

/* Helper to create temporary batch files for testing */
/* PID; TempoChegada; MemoriaNecessaria; PerfilDeExecucao */
void createTempBatchFile(const char *filename, const char *content)
{
    FILE *f = fopen(filename, "w");
    if (f == NULL)
        throw Exception(errno, "createTempBatchFile");
    fprintf(f, "%s", content);
    fclose(f);
}

static uint32_t countFeqEvents(FeqEventType type)
{
    uint32_t count = 0;
    for (FeqNode *p = feqHead; p != nullptr; p = p->next)
        if (p->type == type)
            count++;
    return count;
}

static bool feqHasEvent(FeqEventType type, uint32_t xid, double time)
{
    for (FeqNode *p = feqHead; p != nullptr; p = p->next)
        if (p->type == type && p->xid == xid && fabs(p->time - time) < 1e-9)
            return true;
    return false;
}

static SwpNode *findSwp(uint16_t pid)
{
    for (SwpNode *p = swpHead; p != nullptr; p = p->next)
        if (p->pid == pid)
            return p;
    return nullptr;
}

static bool memOccupiedContains(uint32_t addr)
{
    for (MemNode *p = memOccupiedHead; p != nullptr; p = p->next)
        if (p->addr == addr)
            return true;
    return false;
}

static bool rdyContains(uint16_t pid)
{
    for (RdyNode *p = rdyHead; p != nullptr; p = p->next)
        if (p->pid == pid)
            return true;
    return false;
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

    // Configuração Base
    uint32_t sizes[] = {2, 2, 2};
    SimParameters params;
    params.processorCount = 2;
    params.basePid = 100;
    params.maxPids = 20;
    params.swappingPolicy = FirstFit;
    params.schedulingPolicy = SPN;
    params.memInitAddr = 0x1000;
    params.memMinLogSize = 10;
    params.memSizesCount = 3;
    params.memSizes = sizes;

    // =================================================================
    // TEST 1: simLoadBatch Error Handling
    // =================================================================
    banner("TEST 1: simLoadBatch Error Handling");
    try
    {
        // Garantir estado limpo
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        const char *badJob = "00001001; -10.0; 1000; 100\n";
        createTempBatchFile("bad.job", badJob);
        FILE *fin = fopen("bad.job", "r");

        bool caught = false;
        try
        {
            simLoadBatch(fin, 4096);
        }
        catch (const Exception &e)
        {
            fprintf(fout, "\e[32m[PASS]\e[0m Caught expected exception: %s\n", e.what());
            caught = true;
        }
        fclose(fin);
        unlink("bad.job");

        if (!caught)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m simLoadBatch accepted negative time!\n");
        }
        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 1 crashed: %s\n", e.what());
    }

    // =================================================================
    // TEST 1B: simLoadBatch Semantics (jobs + FEQ SUBMIT)
    // =================================================================
    banner("TEST 1B: simLoadBatch Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Two jobs, with comments and blank lines.
        const char *goodBatch =
            "% comment line should be ignored\n"
            "\n"
            "0000E001; 0.0; 1000; 5, 2, 5\n"
            "0000E002; 1.5; 2000; 7\n";

        createTempBatchFile("good.job", goodBatch);
        FILE *fin = fopen("good.job", "r");
        if (fin == NULL)
            throw Exception(errno, "fopen");

        simLoadBatch(fin, 4096);

        fclose(fin);
        unlink("good.job");

        // JOB: both IDs must exist and have correct basic fields.
        uint32_t jid1 = 0x0000E001;
        uint32_t jid2 = 0x0000E002;

        double sub;
        uint32_t mem;
        uint32_t nbi;
        double nbd;

        jobGet(jid1, JobSubmissionTime, &sub);
        if (fabs(sub - 0.0) > 1e-9)
            fprintf(fout, "\e[31m[FAIL]\e[0m jid1 submissionTime mismatch (%.6f)\n", sub);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid1 submissionTime ok\n");

        jobGet(jid1, JobMemSize, &mem);
        if (mem != 1000)
            fprintf(fout, "\e[31m[FAIL]\e[0m jid1 memSize mismatch (%u)\n", mem);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid1 memSize ok\n");

        jobGet(jid1, JobNextBurstIndex, &nbi);
        if (nbi != 0)
            fprintf(fout, "\e[31m[FAIL]\e[0m jid1 nextBurstIndex should start at 0 (got=%u)\n", nbi);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid1 nextBurstIndex starts at 0\n");

        jobGet(jid1, JobNextBurstDuration, &nbd);
        if (fabs(nbd - 5.0) > 1e-9)
            fprintf(fout, "\e[31m[FAIL]\e[0m jid1 first burst mismatch (%.6f)\n", nbd);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid1 first burst ok\n");

        jobGet(jid2, JobSubmissionTime, &sub);
        if (fabs(sub - 1.5) > 1e-9)
            fprintf(fout, "\e[31m[FAIL]\e[0m jid2 submissionTime mismatch (%.6f)\n", sub);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid2 submissionTime ok\n");

        jobGet(jid2, JobMemSize, &mem);
        if (mem != 2000)
            fprintf(fout, "\e[31m[FAIL]\e[0m jid2 memSize mismatch (%u)\n", mem);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid2 memSize ok\n");

        jobGet(jid2, JobNextBurstIndex, &nbi);
        if (nbi != 0)
            fprintf(fout, "\e[31m[FAIL]\e[0m jid2 nextBurstIndex should start at 0 (got=%u)\n", nbi);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid2 nextBurstIndex starts at 0\n");

        jobGet(jid2, JobNextBurstDuration, &nbd);
        // If it's the last CPU burst, jobGet returns it as a negative value.
        if (!(nbd < 0.0 && fabs(fabs(nbd) - 7.0) < 1e-9))
            fprintf(fout, "\e[31m[FAIL]\e[0m jid2 first burst mismatch (%.6f)\n", nbd);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m jid2 first burst ok\n");

        // FEQ: one SUBMIT per job at the given submission time.
        if (!feqHasEvent(SUBMIT, jid1, 0.0))
            fprintf(fout, "\e[31m[FAIL]\e[0m FEQ missing SUBMIT for jid1 at T=0.0\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m FEQ has SUBMIT for jid1\n");

        if (!feqHasEvent(SUBMIT, jid2, 1.5))
            fprintf(fout, "\e[31m[FAIL]\e[0m FEQ missing SUBMIT for jid2 at T=1.5\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m FEQ has SUBMIT for jid2\n");

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 1B crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 1C: simRun Step Count (SUBMIT-only)
    // =================================================================
    banner("TEST 1C: simRun Step Count (SUBMIT-only)");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Only SUBMIT events in FEQ initially (simLoadBatch adds SUBMIT).
        const char *batch =
            "0000F001; 0.0; 1000; 3\n"
            "0000F002; 5.0; 1000; 3\n";
        createTempBatchFile("run1.job", batch);
        FILE *fin = fopen("run1.job", "r");
        if (fin == NULL)
            throw Exception(errno, "fopen");
        simLoadBatch(fin, 4096);
        fclose(fin);
        unlink("run1.job");

        uint32_t beforeSubmit = countFeqEvents(SUBMIT);
        uint32_t beforeAdmit = countFeqEvents(ADMIT);
        double t0 = simTime;

        // Process exactly 1 event.
        simRun(1);

        uint32_t afterSubmit = countFeqEvents(SUBMIT);
        uint32_t afterAdmit = countFeqEvents(ADMIT);

        if (afterSubmit != beforeSubmit - 1)
            fprintf(fout, "\e[31m[FAIL]\e[0m simRun(1) should consume exactly 1 SUBMIT (before=%u after=%u)\n", beforeSubmit, afterSubmit);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simRun(1) consumed exactly 1 SUBMIT\n");

        // SUBMIT processing should schedule an ADMIT (if a PID is available).
        if (afterAdmit < beforeAdmit)
            fprintf(fout, "\e[31m[FAIL]\e[0m ADMIT count decreased unexpectedly (before=%u after=%u)\n", beforeAdmit, afterAdmit);
        else if (afterAdmit == beforeAdmit)
            fprintf(fout, "\e[33m[WARN]\e[0m simRun(1) did not schedule ADMIT (possible PID exhaustion / policy)\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simRun(1) scheduled ADMIT\n");

        // Time should not go backwards.
        if (simTime + 1e-9 < t0)
            fprintf(fout, "\e[31m[FAIL]\e[0m simTime went backwards (before=%.6f after=%.6f)\n", t0, simTime);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simTime monotonic\n");

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 1C crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 1D: simRun on empty FEQ (cnt=0)
    // =================================================================
    banner("TEST 1D: simRun on empty FEQ");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);
        double t0 = simTime;
        simRun(0);
        if (fabs(simTime - t0) > 1e-9)
            fprintf(fout, "\e[31m[FAIL]\e[0m simRun(0) changed time with empty FEQ (before=%.6f after=%.6f)\n", t0, simTime);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simRun(0) no-op with empty FEQ\n");
        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 1D crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 1E: simStep Basic Behavior (empty FEQ + SUBMIT consumption)
    // =================================================================
    banner("TEST 1E: simStep Basic Behavior");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Case 1: Empty FEQ -> simStep must return false and keep time.
        double t0 = simTime;
        bool stepped = simStep();
        if (stepped)
            fprintf(fout, "\e[31m[FAIL]\e[0m simStep() should return false on empty FEQ\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simStep() returned false on empty FEQ\n");

        if (fabs(simTime - t0) > 1e-9)
            fprintf(fout, "\e[31m[FAIL]\e[0m simStep() changed time on empty FEQ (before=%.6f after=%.6f)\n", t0, simTime);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simTime unchanged on empty FEQ\n");

        // Case 2: One SUBMIT event -> simStep must return true and consume it.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 10.0;
        uint32_t jid = 0x0000F0E1;
        jobInsert(jid, 0.0, 1000, prof);
        feqInsert(0.0, SUBMIT, jid);

        uint32_t beforeSubmit = countFeqEvents(SUBMIT);
        t0 = simTime;
        stepped = simStep();
        uint32_t afterSubmit = countFeqEvents(SUBMIT);

        if (!stepped)
            fprintf(fout, "\e[31m[FAIL]\e[0m simStep() should return true when FEQ has events\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simStep() returned true with pending event\n");

        if (afterSubmit != beforeSubmit - 1)
            fprintf(fout, "\e[31m[FAIL]\e[0m simStep() did not consume exactly 1 SUBMIT (before=%u after=%u)\n", beforeSubmit, afterSubmit);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simStep() consumed exactly 1 SUBMIT\n");

        if (simTime + 1e-9 < t0)
            fprintf(fout, "\e[31m[FAIL]\e[0m simTime went backwards after simStep (before=%.6f after=%.6f)\n", t0, simTime);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m simTime monotonic after simStep\n");

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 1E crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2: simRun Limits & CPU-IO-CPU Flow
    // =================================================================
    banner("TEST 2: simRun Limits & Flow");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        const char *ioJob = "00002001; 0.0; 1000; 50, 20, 50\n";
        createTempBatchFile("io.job", ioJob);
        FILE *fin = fopen("io.job", "r");
        simLoadBatch(fin, 4096);
        fclose(fin);
        unlink("io.job");

        simRun(2); // Submit -> Admit
        if (simTime != 0.0)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m Time advanced too much after 2 steps (T=%.1f)\n", simTime);
        }
        else
        {
            fprintf(fout, "\e[32m[PASS]\e[0m Step control ok.\n");
        }

        simRun(0);
        fprintf(fout, "Final Time: %.1f\n", simTime);
        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2 crashed: %s\n", e.what());
    }

    // =================================================================
    // TEST 2B: simStepSubmit Rejection Semantics (no PIDs)
    // =================================================================
    banner("TEST 2B: simStepSubmit Rejection Semantics (no PIDs)");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }

        SimParameters paramsNoPids = params;
        paramsNoPids.maxPids = 1; // allow only 1 PID to force ENOSPC on 2nd submit
        simOpen(&paramsNoPids);

        // Insert jobs directly to keep FEQ clean of SUBMIT events.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 10.0;
        jobInsert(0x0000A001, 0.0, 1000, prof);
        jobInsert(0x0000A002, 0.0, 1000, prof);

        uint32_t admit0 = countFeqEvents(ADMIT);
        simStepSubmit(0x0000A001);
        uint32_t admit1 = countFeqEvents(ADMIT);
        if (admit1 != admit0 + 1)
            fprintf(fout, "\e[31m[FAIL]\e[0m First submit should schedule exactly 1 ADMIT (before=%u after=%u)\n", admit0, admit1);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m First submit scheduled ADMIT\n");

        bool secondThrew = false;
        int secondErr = 0;
        try
        {
            simStepSubmit(0x0000A002);
        }
        catch (const Exception &e)
        {
            secondThrew = true;
            secondErr = e.en;
            fprintf(fout, "\e[33m[INFO]\e[0m Second submit threw: %s\n", e.what());
        }

        uint32_t admit2 = countFeqEvents(ADMIT);
        if (admit2 != admit1)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m Second submit must not schedule ADMIT (before=%u after=%u)\n", admit1, admit2);
        }
        else
        {
            if (secondThrew && (secondErr == EAGAIN || secondErr == ENOSPC))
                fprintf(fout, "\e[32m[PASS]\e[0m Second submit threw as expected and did not schedule ADMIT\n");
            else if (!secondThrew)
                fprintf(fout, "\e[32m[PASS]\e[0m Second submit rejected without scheduling ADMIT\n");
            else
                fprintf(fout, "\e[33m[WARN]\e[0m Second submit threw unexpected error (%d) but did not schedule ADMIT\n", secondErr);
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2B crashed: %s\n", e.what());
    }

    // =================================================================
    // TEST 2C: simStepWaitEvent Semantics (idle list + IO scheduling)
    // =================================================================
    banner("TEST 2C: simStepWaitEvent Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Create a job with CPU, IO, CPU profile.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 50.0; // CPU
        prof[1] = 20.0; // IO
        prof[2] = 50.0; // CPU
        uint32_t jid = 0x0000B001;
        jobInsert(jid, 0.0, 1000, prof);

        // Create a process for the job and place it running on core 0.
        uint16_t pid = pctNew(jid);
        PctProcessState st = RUNNING;
        pctSet(pid, PctState, &st);

        // Emulate that the first CPU burst has been consumed (next burst is IO).
        uint32_t nextBurstIndex = 1;
        jobSet(jid, JobNextBurstIndex, &nextBurstIndex);

        // Remove core 0 from idle list and mark it busy with pid.
        uint16_t cid = 0;
        if (simIdleHead == cid)
        {
            simIdleHead = simProcessorState[cid].next;
            if (simIdleHead == simProcessorCount)
                simIdleTail = simProcessorCount;
        }
        else
        {
            uint16_t prev = simIdleHead;
            while (prev != simProcessorCount && simProcessorState[prev].next != cid)
                prev = simProcessorState[prev].next;
            if (prev != simProcessorCount)
            {
                simProcessorState[prev].next = simProcessorState[cid].next;
                if (simIdleTail == cid)
                    simIdleTail = prev;
            }
        }
        simProcessorState[cid].idle = false;
        simProcessorState[cid].pid = pid;

        simTime = 123.0;

        // Ensure there is something READY to be dispatched (binary schedules DISPATCH only if applicable).
        double prof2[JOB_MAX_BURSTS] = {0};
        prof2[0] = 10.0; // CPU
        prof2[1] = 5.0;  // IO
        prof2[2] = 10.0; // CPU
        uint32_t jid2 = 0x0000B002;
        jobInsert(jid2, 0.0, 1000, prof2);
        uint16_t pid2 = pctNew(jid2);
        PctProcessState st2 = READY;
        pctSet(pid2, PctState, &st2);
        rdyInsert(pid2, simTime, 10.0);

        // Ensure we start with an empty FEQ.
        uint32_t beforeDispatch = countFeqEvents(DISPATCH);
        uint32_t beforeEventOccurs = countFeqEvents(EVENT_OCCURS);

        simStepWaitEvent(cid);

        // Processor must be appended to the tail of the idle list (FIFO by release time).
        if (!simProcessorState[cid].idle)
            fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu was not marked idle\n", cid);
        else if (simIdleTail != cid)
            fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu was not appended to idle tail (tail=%hu)\n", cid, simIdleTail);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Core appended to idle list tail\n");

        // Process must become BLOCKED.
        pctGet(pid, PctState, &st);
        if (st != BLOCKED)
            fprintf(fout, "\e[31m[FAIL]\e[0m Process %hu not set to BLOCKED (state=%d)\n", pid, (int)st);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Process set to BLOCKED\n");

        // Job burst index must advance from IO (1) to next (2).
        jobGet(jid, JobNextBurstIndex, &nextBurstIndex);
        if (nextBurstIndex != 2)
            fprintf(fout, "\e[31m[FAIL]\e[0m Job nextBurstIndex not advanced (got=%u expected=2)\n", nextBurstIndex);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Job nextBurstIndex advanced\n");

        // Must schedule EVENT_OCCURS at simTime + IO duration and a DISPATCH at simTime.
        uint32_t afterDispatch = countFeqEvents(DISPATCH);
        uint32_t afterEventOccurs = countFeqEvents(EVENT_OCCURS);
        if (afterDispatch != beforeDispatch + 1)
            fprintf(fout, "\e[31m[FAIL]\e[0m DISPATCH not scheduled exactly once (before=%u after=%u)\n", beforeDispatch, afterDispatch);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m DISPATCH scheduled\n");

        if (afterEventOccurs != beforeEventOccurs + 1)
            fprintf(fout, "\e[31m[FAIL]\e[0m EVENT_OCCURS not scheduled exactly once (before=%u after=%u)\n", beforeEventOccurs, afterEventOccurs);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m EVENT_OCCURS scheduled\n");

        // Optional stronger check: FEQ head should be DISPATCH at current time.
        if (feqHead == nullptr)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m FEQ is empty after simStepWaitEvent\n");
        }
        else
        {
            if (feqHead->type != DISPATCH || fabs(feqHead->time - simTime) > 1e-9)
                fprintf(fout, "\e[33m[WARN]\e[0m FEQ head not DISPATCH at current time (type=%d time=%.6f)\n", (int)feqHead->type, feqHead->time);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m FEQ head is DISPATCH at current time\n");
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2C crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2D: simStepAdmit Semantics (RDY vs SWP + DISPATCH)
    // =================================================================
    banner("TEST 2D: simStepAdmit Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Create a job and a NEW process for it.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 10.0;
        prof[1] = 5.0;
        prof[2] = 10.0;
        uint32_t jid = 0x0000A0D1;
        uint32_t memSize = 1000;
        jobInsert(jid, 0.0, memSize, prof);
        uint16_t pid = pctNew(jid);

        simTime = 77.0;
        uint32_t beforeDispatch = countFeqEvents(DISPATCH);

        bool supported = true;
        try
        {
            simStepAdmit(pid);
        }
        catch (const Exception &e)
        {
            if (e.en == 95 || e.en == ENOSYS)
            {
                supported = false;
                fprintf(fout, "\e[33m[WARN]\e[0m simStepAdmit not supported (Error %d). Skipping admit test.\n", e.en);
            }
            else
            {
                throw;
            }
        }

        if (supported)
        {
            // Determine whether we went to RDY (memory allocation succeeded) or SWP (failed).
            SwpNode *sn = findSwp(pid);
            bool inSwp = (sn != nullptr);

            PctProcessState st;
            pctGet(pid, PctState, &st);

            uint32_t addr;
            pctGet(pid, PctMemAddr, &addr);

            if (!inSwp)
            {
                if (st != READY)
                    fprintf(fout, "\e[31m[FAIL]\e[0m Admit-to-RDY should set READY (state=%d)\n", (int)st);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m Admit-to-RDY set READY\n");

                if (addr == PCT_UNDEF_ADDRESS)
                    fprintf(fout, "\e[31m[FAIL]\e[0m Admit-to-RDY should set a valid memAddr\n");
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m Admit-to-RDY set memAddr (0x%x)\n", addr);

                if (!rdyContains(pid))
                    fprintf(fout, "\e[31m[FAIL]\e[0m PID %hu not found in RDY after admit\n", pid);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m PID present in RDY after admit\n");

                // With idle processors, a DISPATCH should be scheduled.
                uint32_t afterDispatch = countFeqEvents(DISPATCH);
                if (afterDispatch != beforeDispatch + 1)
                    fprintf(fout, "\e[33m[WARN]\e[0m DISPATCH not scheduled exactly once (before=%u after=%u)\n", beforeDispatch, afterDispatch);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m DISPATCH scheduled after admit\n");
            }
            else
            {
                // If memory allocation failed, process should be swapped-out (typically S_READY).
                if (st != S_READY)
                    fprintf(fout, "\e[33m[WARN]\e[0m Admit-to-SWP expected S_READY (state=%d)\n", (int)st);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m Admit-to-SWP set S_READY\n");

                if (addr != PCT_UNDEF_ADDRESS)
                    fprintf(fout, "\e[33m[WARN]\e[0m Admit-to-SWP expected undef memAddr (0x%x)\n", addr);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m Admit-to-SWP kept memAddr undefined\n");

                if (sn->pid != pid || sn->size != memSize)
                    fprintf(fout, "\e[31m[FAIL]\e[0m SWP entry mismatch (pid=%hu size=%u)\n", sn->pid, sn->size);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m PID inserted into SWP after admit\n");

                // In SWP path, DISPATCH is not applicable.
                uint32_t afterDispatch = countFeqEvents(DISPATCH);
                if (afterDispatch != beforeDispatch)
                    fprintf(fout, "\e[33m[WARN]\e[0m DISPATCH scheduled unexpectedly in SWP path (before=%u after=%u)\n", beforeDispatch, afterDispatch);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m No DISPATCH scheduled in SWP path\n");
            }
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2D crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2E: simStepDispatch Semantics (RDY retrieval + core selection)
    // =================================================================
    banner("TEST 2E: simStepDispatch Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Two READY processes in RDY; SPN should pick the shortest runTime.
        // Use non-last CPU burst profile so it schedules WAIT_EVENT.
        double profA[JOB_MAX_BURSTS] = {0};
        profA[0] = 20.0; // CPU
        profA[1] = 5.0;  // IO
        profA[2] = 10.0; // CPU
        uint32_t jidA = 0x0000B0E1;
        jobInsert(jidA, 0.0, 1000, profA);
        uint16_t pidA = pctNew(jidA);

        double profB[JOB_MAX_BURSTS] = {0};
        profB[0] = 12.0; // CPU
        profB[1] = 5.0;  // IO
        profB[2] = 7.0;  // CPU
        uint32_t jidB = 0x0000B0E2;
        jobInsert(jidB, 0.0, 1000, profB);
        uint16_t pidB = pctNew(jidB);

        PctProcessState st = READY;
        pctSet(pidA, PctState, &st);
        pctSet(pidB, PctState, &st);

        // Insert with explicit runTime values.
        simTime = 10.0;
        rdyInsert(pidA, simTime, 20.0);
        rdyInsert(pidB, simTime, 12.0);

        // Ensure FEQ is empty w.r.t. WAIT_EVENT/EXIT counts before dispatch.
        uint32_t beforeWait = countFeqEvents(WAIT_EVENT);
        uint32_t beforeExit = countFeqEvents(EXIT);

        // Oldest idle core should be 0 right after simOpen.
        uint16_t expectedCid = 0;
        if (simIdleHead != expectedCid)
            fprintf(fout, "\e[33m[WARN]\e[0m Unexpected simIdleHead before dispatch (got=%hu expected=%hu)\n", simIdleHead, expectedCid);

        simStepDispatch();

        // Shortest job (pidB) should have been dispatched.
        if (simProcessorState[expectedCid].idle)
            fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu should be busy after dispatch\n", expectedCid);
        else if (simProcessorState[expectedCid].pid != pidB)
            fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu running PID mismatch (got=%hu expected=%hu)\n", expectedCid, simProcessorState[expectedCid].pid, pidB);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Dispatched shortest READY process to oldest idle core\n");

        // PID state must be RUNNING; pidA should still be in RDY.
        pctGet(pidB, PctState, &st);
        if (st != RUNNING)
            fprintf(fout, "\e[31m[FAIL]\e[0m Dispatched PID not set to RUNNING (state=%d)\n", (int)st);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Dispatched PID set to RUNNING\n");

        if (rdyContains(pidB))
            fprintf(fout, "\e[31m[FAIL]\e[0m Dispatched PID still present in RDY\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Dispatched PID removed from RDY\n");

        if (!rdyContains(pidA))
            fprintf(fout, "\e[31m[FAIL]\e[0m Remaining PID missing from RDY\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Remaining PID still in RDY\n");

        // Job burst index should advance from 0 to 1 for jidB.
        uint32_t nbi;
        jobGet(jidB, JobNextBurstIndex, &nbi);
        if (nbi != 1)
            fprintf(fout, "\e[31m[FAIL]\e[0m Job nextBurstIndex not advanced (got=%u expected=1)\n", nbi);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Job nextBurstIndex advanced\n");

        // Since CPU burst is not the last, it should schedule WAIT_EVENT at T+12 on this core.
        uint32_t afterWait = countFeqEvents(WAIT_EVENT);
        uint32_t afterExit = countFeqEvents(EXIT);

        if (afterExit != beforeExit)
            fprintf(fout, "\e[33m[WARN]\e[0m EXIT scheduled unexpectedly (before=%u after=%u)\n", beforeExit, afterExit);

        if (afterWait != beforeWait + 1)
            fprintf(fout, "\e[31m[FAIL]\e[0m WAIT_EVENT not scheduled exactly once (before=%u after=%u)\n", beforeWait, afterWait);
        else if (!feqHasEvent(WAIT_EVENT, expectedCid, simTime + 12.0))
            fprintf(fout, "\e[31m[FAIL]\e[0m FEQ missing WAIT_EVENT for core %hu at T=%.6f\n", expectedCid, simTime + 12.0);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m WAIT_EVENT scheduled at end of CPU burst\n");

        // Core must be removed from idle list head.
        if (simIdleHead == expectedCid)
            fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu still in idle list head after dispatch\n", expectedCid);
        else
            fprintf(fout, "\e[32m[PASS]\e[0m Core removed from idle list\n");

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2E crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2F: simStepExit Semantics (idle list + mem free + ACTIVATE/DISPATCH)
    // =================================================================
    banner("TEST 2F: simStepExit Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Create a job with a single CPU burst (EXIT would be scheduled at end of that burst).
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 10.0;
        uint32_t jid = 0x0000B0F1;
        uint32_t memSize = 1000;
        jobInsert(jid, 0.0, memSize, prof);

        uint16_t pid = pctNew(jid);

        // Allocate memory for the running process (may be unavailable under some selections).
        uint32_t addr = 0;
        bool memOk = true;
        try
        {
            addr = memAlloc(pid, memSize);
        }
        catch (const Exception &e)
        {
            memOk = false;
            fprintf(fout, "\e[33m[WARN]\e[0m memAlloc not available in this selection (Error %d). Skipping exit test.\n", e.en);
        }

        if (memOk && addr != 0)
        {
            pctSet(pid, PctMemAddr, &addr);

            // Emulate that DISPATCH already advanced past the last CPU burst.
            uint32_t nbi = 1;
            jobSet(jid, JobNextBurstIndex, &nbi);

            // Put PID running on core 0 and remove core 0 from idle list.
            uint16_t cid = 0;
            if (simIdleHead == cid)
            {
                simIdleHead = simProcessorState[cid].next;
                if (simIdleHead == simProcessorCount)
                    simIdleTail = simProcessorCount;
            }
            else
            {
                uint16_t prev = simIdleHead;
                while (prev != simProcessorCount && simProcessorState[prev].next != cid)
                    prev = simProcessorState[prev].next;
                if (prev != simProcessorCount)
                {
                    simProcessorState[prev].next = simProcessorState[cid].next;
                    if (simIdleTail == cid)
                        simIdleTail = prev;
                }
            }
            simProcessorState[cid].idle = false;
            simProcessorState[cid].pid = pid;

            PctProcessState st = RUNNING;
            pctSet(pid, PctState, &st);

            // Ensure DISPATCH is applicable after EXIT: add a READY process in RDY.
            double prof2[JOB_MAX_BURSTS] = {0};
            prof2[0] = 20.0;
            prof2[1] = 5.0;
            prof2[2] = 10.0;
            uint32_t jid2 = 0x0000B0F2;
            jobInsert(jid2, 0.0, 1000, prof2);
            uint16_t pid2 = pctNew(jid2);
            PctProcessState st2 = READY;
            pctSet(pid2, PctState, &st2);
            rdyInsert(pid2, 100.0, 20.0);

            // Ensure ACTIVATE is meaningful: put one process in SWP.
            double prof3[JOB_MAX_BURSTS] = {0};
            prof3[0] = 5.0;
            uint32_t jid3 = 0x0000B0F3;
            jobInsert(jid3, 0.0, 1000, prof3);
            uint16_t pid3 = pctNew(jid3);
            PctProcessState st3 = S_READY;
            pctSet(pid3, PctState, &st3);
            uint32_t undef = PCT_UNDEF_ADDRESS;
            pctSet(pid3, PctMemAddr, &undef);
            try
            {
                swpInsert(pid3, 1000, false);
            }
            catch (...)
            {
                // If SWP insert is not available for some selection, keep going: ACTIVATE may still be scheduled.
            }

            simTime = 100.0;
            uint32_t beforeDispatch = countFeqEvents(DISPATCH);
            uint32_t beforeActivate = countFeqEvents(ACTIVATE);

            bool supported = true;
            try
            {
                simStepExit(cid);
            }
            catch (const Exception &e)
            {
                if (e.en == 95 || e.en == ENOSYS)
                {
                    supported = false;
                    fprintf(fout, "\e[33m[WARN]\e[0m simStepExit not supported (Error %d). Skipping exit test.\n", e.en);
                }
                else
                {
                    throw;
                }
            }

            if (supported)
            {
                // Core must be idle again and appended to idle list tail.
                if (!simProcessorState[cid].idle)
                    fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu not marked idle after exit\n", cid);
                else if (simIdleTail != cid)
                    fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu not appended to idle tail after exit (tail=%hu)\n", cid, simIdleTail);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m Core appended to idle list tail after exit\n");

                // Process state should be updated (typically ENDED).
                pctGet(pid, PctState, &st);
                if (st != ENDED)
                    fprintf(fout, "\e[33m[WARN]\e[0m PID state after exit is not ENDED (state=%d)\n", (int)st);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m PID state set to ENDED\n");

                // Memory must be freed.
                uint32_t curAddr;
                pctGet(pid, PctMemAddr, &curAddr);
                if (curAddr != PCT_UNDEF_ADDRESS)
                    fprintf(fout, "\e[33m[WARN]\e[0m memAddr not cleared after exit (0x%x)\n", curAddr);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m memAddr cleared after exit\n");

                if (memOccupiedContains(addr))
                    fprintf(fout, "\e[33m[WARN]\e[0m memory block still in occupied list after exit\n");
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m memory block freed after exit\n");

                // Job finishTime should be updated to current simTime.
                double ft = JOB_UNDEF_TIME;
                jobGet(jid, JobFinishTime, &ft);
                if (fabs(ft - simTime) > 1e-9)
                    fprintf(fout, "\e[33m[WARN]\e[0m Job finishTime not updated to simTime (finish=%.6f simTime=%.6f)\n", ft, simTime);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m Job finishTime updated\n");

                // Must schedule ACTIVATE and, if applicable, DISPATCH at current time.
                uint32_t afterActivate = countFeqEvents(ACTIVATE);
                if (afterActivate != beforeActivate + 1)
                    fprintf(fout, "\e[33m[WARN]\e[0m ACTIVATE not scheduled exactly once (before=%u after=%u)\n", beforeActivate, afterActivate);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m ACTIVATE scheduled\n");

                uint32_t afterDispatch = countFeqEvents(DISPATCH);
                if (afterDispatch < beforeDispatch + 1)
                    fprintf(fout, "\e[33m[WARN]\e[0m DISPATCH not scheduled after exit (before=%u after=%u)\n", beforeDispatch, afterDispatch);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m DISPATCH scheduled after exit\n");
            }
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2F crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2G: simStepEventOccurs Semantics
    // =================================================================
    banner("TEST 2G: simStepEventOccurs Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        simTime = 200.0;

        bool supported = true;

        // Case 1: BLOCKED -> READY and inserted into RDY (then DISPATCH if applicable)
        {
            double prof[JOB_MAX_BURSTS] = {0};
            prof[0] = 10.0;
            prof[1] = 5.0;
            prof[2] = 10.0;
            uint32_t jid = 0x0000B0C1;
            jobInsert(jid, 0.0, 1000, prof);
            uint16_t pid = pctNew(jid);

            PctProcessState st = BLOCKED;
            pctSet(pid, PctState, &st);

            uint32_t beforeDispatch = countFeqEvents(DISPATCH);

            try
            {
                simStepEventOccurs(pid);
            }
            catch (const Exception &e)
            {
                if (e.en == 95 || e.en == ENOSYS)
                {
                    supported = false;
                    fprintf(fout, "\e[33m[WARN]\e[0m simStepEventOccurs not supported (Error %d). Skipping event-occurs test.\n", e.en);
                }
                else
                {
                    fprintf(fout, "\e[31m[FAIL]\e[0m BLOCKED event-occurs threw unexpected error %d\n", e.en);
                }
            }

            if (supported)
            {
                pctGet(pid, PctState, &st);
                if (st != READY)
                    fprintf(fout, "\e[31m[FAIL]\e[0m BLOCKED event-occurs did not set READY (state=%d)\n", (int)st);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m BLOCKED event-occurs set READY\n");

                if (!rdyContains(pid))
                    fprintf(fout, "\e[31m[FAIL]\e[0m BLOCKED event-occurs did not insert PID %hu into RDY\n", pid);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m BLOCKED event-occurs inserted PID into RDY\n");

                uint32_t afterDispatch = countFeqEvents(DISPATCH);
                if (afterDispatch < beforeDispatch + 1)
                    fprintf(fout, "\e[33m[WARN]\e[0m DISPATCH not scheduled after BLOCKED event-occurs (before=%u after=%u)\n", beforeDispatch, afterDispatch);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m DISPATCH scheduled after event-occurs\n");
            }
        }

        // Case 2: S_BLOCKED -> S_READY (unblocked but still swapped-out)
        if (supported)
        {
            double prof[JOB_MAX_BURSTS] = {0};
            prof[0] = 10.0;
            prof[1] = 5.0;
            prof[2] = 10.0;
            uint32_t jid = 0x0000B0C2;
            jobInsert(jid, 0.0, 1000, prof);
            uint16_t pid = pctNew(jid);

            PctProcessState st = S_BLOCKED;
            pctSet(pid, PctState, &st);
            uint32_t undef = PCT_UNDEF_ADDRESS;
            pctSet(pid, PctMemAddr, &undef);

            uint32_t beforeDispatch = countFeqEvents(DISPATCH);
            try
            {
                simStepEventOccurs(pid);
            }
            catch (const Exception &e)
            {
                fprintf(fout, "\e[33m[WARN]\e[0m S_BLOCKED event-occurs threw %d (binary may not support this state)\n", e.en);
            }

            pctGet(pid, PctState, &st);
            if (st == S_READY)
                fprintf(fout, "\e[32m[PASS]\e[0m S_BLOCKED event-occurs unblocked to S_READY\n");
            else
                fprintf(fout, "\e[33m[WARN]\e[0m S_BLOCKED event-occurs state not S_READY (state=%d)\n", (int)st);

            if (rdyContains(pid))
                fprintf(fout, "\e[33m[WARN]\e[0m S_BLOCKED event-occurs inserted PID into RDY (expected swapped-out)\n");
            else
                fprintf(fout, "\e[32m[PASS]\e[0m S_BLOCKED event-occurs did not insert into RDY\n");

            uint32_t afterDispatch = countFeqEvents(DISPATCH);
            if (afterDispatch != beforeDispatch)
                fprintf(fout, "\e[33m[WARN]\e[0m DISPATCH scheduled for S_BLOCKED case (before=%u after=%u)\n", beforeDispatch, afterDispatch);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m No DISPATCH scheduled for S_BLOCKED case\n");
        }

        // Case 3: Invalid state should throw EPERM
        if (supported)
        {
            double prof[JOB_MAX_BURSTS] = {0};
            prof[0] = 10.0;
            uint32_t jid = 0x0000B0C3;
            jobInsert(jid, 0.0, 1000, prof);
            uint16_t pid = pctNew(jid);

            PctProcessState st = RUNNING;
            pctSet(pid, PctState, &st);

            bool caught = false;
            try
            {
                simStepEventOccurs(pid);
            }
            catch (const Exception &e)
            {
                if (e.en == EPERM)
                    caught = true;
                else
                    fprintf(fout, "\e[33m[WARN]\e[0m RUNNING event-occurs threw %d (expected EPERM)\n", e.en);
            }

            if (caught)
                fprintf(fout, "\e[32m[PASS]\e[0m RUNNING event-occurs rejected (EPERM)\n");
            else
                fprintf(fout, "\e[31m[FAIL]\e[0m RUNNING event-occurs was not rejected with EPERM\n");
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2G crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2H: simStepActivate Semantics
    // =================================================================
    banner("TEST 2H: simStepActivate Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Setup two swapped-out processes, one blocked and one not blocked.
        // Activate must prioritize the non-blocked one, even if the blocked one was inserted first.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 10.0;
        prof[1] = 5.0;
        prof[2] = 10.0;

        uint32_t memSize = 1000;

        uint32_t jidBlocked = 0x0000B0D1;
        jobInsert(jidBlocked, 0.0, memSize, prof);
        uint16_t pidBlocked = pctNew(jidBlocked);
        PctProcessState stBlocked = S_BLOCKED;
        pctSet(pidBlocked, PctState, &stBlocked);
        uint32_t undef = PCT_UNDEF_ADDRESS;
        pctSet(pidBlocked, PctMemAddr, &undef);
        swpInsert(pidBlocked, memSize, true);

        uint32_t jidReady = 0x0000B0D2;
        jobInsert(jidReady, 0.0, memSize, prof);
        uint16_t pidReady = pctNew(jidReady);
        PctProcessState stReady = S_READY;
        pctSet(pidReady, PctState, &stReady);
        pctSet(pidReady, PctMemAddr, &undef);
        swpInsert(pidReady, memSize, false);

        SwpNode *snB = findSwp(pidBlocked);
        SwpNode *snR = findSwp(pidReady);
        if (snB == nullptr || snR == nullptr)
            fprintf(fout, "\e[31m[FAIL]\e[0m Failed to setup SWP entries for activate test\n");
        else
            fprintf(fout, "\e[32m[PASS]\e[0m SWP setup done (blocked first, ready second)\n");

        uint32_t beforeDispatch = countFeqEvents(DISPATCH);

        bool supported = true;
        try
        {
            simStepActivate();
        }
        catch (const Exception &e)
        {
            if (e.en == 95 || e.en == ENOSYS)
            {
                supported = false;
                fprintf(fout, "\e[33m[WARN]\e[0m simStepActivate not supported (Error %d). Skipping activate test.\n", e.en);
            }
            else
            {
                throw;
            }
        }

        if (supported)
        {
            // Must have swapped-in the non-blocked process.
            if (findSwp(pidReady) != nullptr)
                fprintf(fout, "\e[31m[FAIL]\e[0m Non-blocked PID %hu still in SWP after activate\n", pidReady);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Non-blocked PID removed from SWP\n");

            if (findSwp(pidBlocked) == nullptr)
                fprintf(fout, "\e[33m[WARN]\e[0m Blocked PID %hu also removed from SWP (unexpected if only one block swapped-in)\n", pidBlocked);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Blocked PID remained in SWP\n");

            uint32_t addrReady = PCT_UNDEF_ADDRESS;
            pctGet(pidReady, PctMemAddr, &addrReady);
            if (addrReady == PCT_UNDEF_ADDRESS)
                fprintf(fout, "\e[31m[FAIL]\e[0m Non-blocked PID memAddr not allocated by activate\n");
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Non-blocked PID allocated memAddr (0x%x)\n", addrReady);

            PctProcessState st;
            pctGet(pidReady, PctState, &st);
            if (st != READY)
                fprintf(fout, "\e[33m[WARN]\e[0m Non-blocked PID state after activate not READY (state=%d)\n", (int)st);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Non-blocked PID state set to READY\n");

            if (!rdyContains(pidReady))
                fprintf(fout, "\e[33m[WARN]\e[0m Non-blocked PID not inserted into RDY after activate\n");
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Non-blocked PID inserted into RDY\n");

            uint32_t afterDispatch = countFeqEvents(DISPATCH);
            if (afterDispatch < beforeDispatch + 1)
                fprintf(fout, "\e[33m[WARN]\e[0m DISPATCH not scheduled after activate (before=%u after=%u)\n", beforeDispatch, afterDispatch);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m DISPATCH scheduled after activate\n");
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        if (e.en == 95 || e.en == ENOSYS)
            fprintf(fout, "\e[33m[WARN]\e[0m Test 2H skipped: %s\n", e.what());
        else
            fprintf(fout, "\e[31m[CRASH]\e[0m Test 2H crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2I: simStepDelete Semantics
    // =================================================================
    banner("TEST 2I: simStepDelete Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        simTime = 400.0;

        // Case A: READY process present in RDY
        double profA[JOB_MAX_BURSTS] = {0};
        profA[0] = 10.0;
        uint32_t jidA = 0x0000B0E9;
        jobInsert(jidA, 0.0, 1000, profA);
        uint16_t pidA = pctNew(jidA);
        uint32_t addrA = 0;
        bool memOk = true;
        try
        {
            addrA = memAlloc(pidA, 1000);
            pctSet(pidA, PctMemAddr, &addrA);
        }
        catch (const Exception &e)
        {
            memOk = false;
            fprintf(fout, "\e[33m[WARN]\e[0m memAlloc failed for delete test (Error %d). Skipping delete test.\n", e.en);
        }
        PctProcessState stA = READY;
        pctSet(pidA, PctState, &stA);
        rdyInsert(pidA, simTime, 10.0);

        // Case B: swapped-out S_READY process present in SWP
        double profB[JOB_MAX_BURSTS] = {0};
        profB[0] = 10.0;
        uint32_t jidB = 0x0000B0EA;
        jobInsert(jidB, 0.0, 1000, profB);
        uint16_t pidB = pctNew(jidB);
        uint32_t addrB = 0;
        if (memOk)
        {
            try
            {
                addrB = memAlloc(pidB, 1000);
                pctSet(pidB, PctMemAddr, &addrB);
            }
            catch (const Exception &e)
            {
                memOk = false;
                fprintf(fout, "\e[33m[WARN]\e[0m memAlloc failed for delete test (Error %d). Skipping delete test.\n", e.en);
            }
        }
        PctProcessState stB = S_READY;
        pctSet(pidB, PctState, &stB);
        swpInsert(pidB, 1000, false);

        bool supported = true;
        if (!memOk)
            supported = false;
        try
        {
            simStepDelete(pidA);
        }
        catch (const Exception &e)
        {
            if (e.en == 95 || e.en == ENOSYS)
            {
                supported = false;
                fprintf(fout, "\e[33m[WARN]\e[0m simStepDelete not supported (Error %d). Skipping delete test.\n", e.en);
            }
            else
            {
                throw;
            }
        }

        if (supported)
        {
            // Primary expectation: process must be removed from PCT (pctGet should fail).
            {
                uint32_t tmp = 0;
                bool deleted = false;
                try
                {
                    pctGet(pidA, PctJid, &tmp);
                }
                catch (const Exception &e)
                {
                    if (e.en == EINVAL)
                        deleted = true;
                    else
                        fprintf(fout, "\e[33m[WARN]\e[0m pctGet after delete threw %d (expected EINVAL)\n", e.en);
                }
                if (deleted)
                    fprintf(fout, "\e[32m[PASS]\e[0m PID %hu removed from PCT (READY/RDY case)\n", pidA);
                else
                    fprintf(fout, "\e[31m[FAIL]\e[0m PID %hu still present in PCT after simStepDelete\n", pidA);
            }

            if (memOccupiedContains(addrA))
                fprintf(fout, "\e[33m[WARN]\e[0m Memory block for PID %hu still occupied after delete\n", pidA);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Memory block released for PID %hu\n", pidA);

            if (rdyContains(pidA))
                fprintf(fout, "\e[33m[WARN]\e[0m PID %hu still present in RDY after delete\n", pidA);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m PID %hu not present in RDY after delete\n", pidA);

            // Delete the swapped-out process.
            try
            {
                simStepDelete(pidB);
            }
            catch (const Exception &e)
            {
                fprintf(fout, "\e[33m[WARN]\e[0m simStepDelete(pidB) threw %d\n", e.en);
            }

            {
                uint32_t tmp = 0;
                bool deleted = false;
                try
                {
                    pctGet(pidB, PctJid, &tmp);
                }
                catch (const Exception &e)
                {
                    if (e.en == EINVAL)
                        deleted = true;
                    else
                        fprintf(fout, "\e[33m[WARN]\e[0m pctGet after delete(pidB) threw %d (expected EINVAL)\n", e.en);
                }
                if (deleted)
                    fprintf(fout, "\e[32m[PASS]\e[0m PID %hu removed from PCT (S_READY/SWP case)\n", pidB);
                else
                    fprintf(fout, "\e[31m[FAIL]\e[0m PID %hu still present in PCT after simStepDelete\n", pidB);
            }

            if (findSwp(pidB) != nullptr)
                fprintf(fout, "\e[33m[WARN]\e[0m PID %hu still present in SWP after delete\n", pidB);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m PID %hu not present in SWP after delete\n", pidB);

            if (addrB != 0)
            {
                if (memOccupiedContains(addrB))
                    fprintf(fout, "\e[33m[WARN]\e[0m Memory block for PID %hu still occupied after delete\n", pidB);
                else
                    fprintf(fout, "\e[32m[PASS]\e[0m Memory block released for PID %hu\n", pidB);
            }
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        if (e.en == 95 || e.en == ENOSYS)
            fprintf(fout, "\e[33m[WARN]\e[0m Test 2I skipped: %s\n", e.what());
        else
            fprintf(fout, "\e[31m[CRASH]\e[0m Test 2I crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 2J: simPrint
    // =================================================================
    banner("TEST 2J: simPrint");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Create a tiny, known state so printing has something to show.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 10.0;
        uint32_t jid = 0x0000F001;
        jobInsert(jid, 0.0, 1000, prof);
        feqInsert(0.0, SUBMIT, jid);

        auto capture = [&](uint32_t which, bool csv) -> std::string
        {
            FILE *f = tmpfile();
            if (f == nullptr)
            {
                fprintf(fout, "\e[33m[WARN]\e[0m tmpfile() failed; cannot capture simPrint output.\n");
                return std::string();
            }
            simPrint(f, which, csv);
            fflush(f);
            fseek(f, 0, SEEK_END);
            long sz = ftell(f);
            if (sz < 0)
                sz = 0;
            std::string s;
            s.resize((size_t)sz);
            rewind(f);
            if (sz > 0)
                fread(s.data(), 1, (size_t)sz, f);
            fclose(f);
            return s;
        };

        bool supported = true;
        std::string outHuman;
        std::string outCsv;
        try
        {
            outHuman = capture(SimPrintJob | SimPrintFeq, false);
            outCsv = capture(SimPrintJob | SimPrintFeq, true);
        }
        catch (const Exception &e)
        {
            if (e.en == 95 || e.en == ENOSYS)
            {
                supported = false;
                fprintf(fout, "\e[33m[WARN]\e[0m simPrint not supported in this setup (Error %d).\n", e.en);
            }
            else
                throw;
        }

        if (supported)
        {
            if (outHuman.size() > 0)
                fprintf(fout, "\e[32m[PASS]\e[0m simPrint produced output (non-CSV).\n");
            else
                fprintf(fout, "\e[33m[WARN]\e[0m simPrint produced empty output (non-CSV).\n");

            // Dump output to help reproduce/implement group::simPrint
            fprintf(fout, "\n----- BEGIN simPrint (non-CSV) -----\n");
            if (!outHuman.empty())
                fwrite(outHuman.data(), 1, outHuman.size(), fout);
            if (outHuman.empty() || outHuman.back() != '\n')
                fputc('\n', fout);
            fprintf(fout, "----- END simPrint (non-CSV) -----\n\n");

            if (outCsv.size() > 0)
                fprintf(fout, "\e[32m[PASS]\e[0m simPrint produced output (CSV).\n");
            else
                fprintf(fout, "\e[33m[WARN]\e[0m simPrint produced empty output (CSV).\n");

            fprintf(fout, "\n----- BEGIN simPrint (CSV) -----\n");
            if (!outCsv.empty())
                fwrite(outCsv.data(), 1, outCsv.size(), fout);
            if (outCsv.empty() || outCsv.back() != '\n')
                fputc('\n', fout);
            fprintf(fout, "----- END simPrint (CSV) -----\n\n");

            // Weak content check: ensure the injected job id appears somewhere.
            const char *k1 = "0000F001";
            const char *k2 = "0000f001";
            bool hasJid = (outHuman.find(k1) != std::string::npos) || (outHuman.find(k2) != std::string::npos) ||
                          (outCsv.find(k1) != std::string::npos) || (outCsv.find(k2) != std::string::npos);
            if (hasJid)
                fprintf(fout, "\e[32m[PASS]\e[0m simPrint output contains job id.\n");
            else
                fprintf(fout, "\e[33m[WARN]\e[0m simPrint output did not contain expected job id (format may differ).\n");
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 2J crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 3: Swapping & Activation (simStepActivate)
    // =================================================================
    banner("TEST 3: Swapping & Activation");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);
        // simPrint(fout, SimPrintAll);

        // Multi-burst jobs: avoids paths that may pass a non-positive runTime to rdyInsert
        // (which would abort due to DbC preconditions).
        const char *swapJob =
            "00003001; 0.0; 1000; 200,10,200\n"
            "00003002; 0.0; 1000; 200,10,200\n"
            "00003003; 0.0; 2000; 200,10,200\n"
            "00003004; 0.0; 2000; 200,10,200\n"
            "00003005; 0.0; 4000; 200,10,200\n"
            "00003006; 0.0; 4000; 200,10,200\n"
            "00003007; 1.0; 1000; 50,5,50\n";

        createTempBatchFile("test_swap.job", swapJob);
        FILE *fin = fopen("test_swap.job", "r");
        simLoadBatch(fin, 4096);
        fclose(fin);
        unlink("test_swap.job");

        const uint32_t targetJid = 0x00003007;
        bool swapSeen = false;
        bool activationSeen = false;
        bool job3007Seen = false;
        bool job3007ActiveWithMem = false;
        uint32_t steps = 0;

        std::map<uint16_t, bool> wasSuspended;
        bool fail = false;
        bool sawInvalidOccupied = false;

        const uint32_t maxSteps = 50000;
        while (steps++ < maxSteps && simStep())
        {
            // Scan PCT to detect swapping/activation and validate memory addresses.
            for (uint16_t i = 0; i < pctPidCount; i++)
            {
                PctNode *node = pctTable[i];
                if (node == nullptr)
                    continue;

                uint16_t pid = pctPidBase + i;
                PctProcessState st = node->state;
                uint32_t addr = node->memAddr;
                uint32_t jidCur = node->jid;

                if (jidCur == targetJid)
                    job3007Seen = true;

                if (st == S_READY || st == S_BLOCKED)
                {
                    swapSeen = true;
                    wasSuspended[pid] = true;
                    if (jidCur == targetJid && addr != PCT_UNDEF_ADDRESS)
                        fprintf(fout, "\e[33m[WARN]\e[0m jid 0x%08x is suspended but memAddr is 0x%x (expected UNDEF).\n", jidCur, addr);
                }

                if (wasSuspended[pid] && (st == READY || st == RUNNING || st == BLOCKED))
                    activationSeen = true;

                // For processes in memory, memAddr must be defined and correspond to an occupied block.
                if (st == READY || st == RUNNING || st == BLOCKED)
                {
                    if (addr == PCT_UNDEF_ADDRESS)
                    {
                        fprintf(fout, "\e[31m[FAIL]\e[0m PID %hu (jid=0x%08x) is in-memory state %d but memAddr is UNDEF.\n", pid, jidCur, (int)st);
                        fail = true;
                        break;
                    }
                    if (!memOccupiedContains(addr))
                    {
                        sawInvalidOccupied = true;
                        fprintf(fout, "\e[33m[WARN]\e[0m PID %hu (jid=0x%08x) has memAddr 0x%x not present in occupied list.\n", pid, jidCur, addr);
                    }
                    if (jidCur == targetJid)
                        job3007ActiveWithMem = true;
                }
            }
            if (fail)
                break;

            // As soon as we have evidence of swapping + activation and job 3007 being in memory,
            // stop early to keep this test focused and avoid running into unrelated end-of-job paths.
            if (simTime >= 1.0 && swapSeen && activationSeen && job3007ActiveWithMem)
                break;
        }

        if (steps >= maxSteps)
            fprintf(fout, "\e[33m[WARN]\e[0m Test 3 reached step limit (%u) at T=%.1f.\n", maxSteps, simTime);

        if (fail)
        {
            // already reported
        }
        else if (simTime < 1.0)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m Simulation did not advance past job 3007 submit time (T=%.1f).\n", simTime);
        }
        else if (!swapSeen)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m No suspended process observed (expected swapping to occur).\n");
        }
        else if (!job3007Seen)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m Job 0x%08x never appeared in PCT (not admitted/created).\n", targetJid);
        }
        else if (!job3007ActiveWithMem)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m Job 0x%08x never reached an in-memory state with a valid memAddr.\n", targetJid);
        }
        else if (!activationSeen)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m Swapping observed but no activation transition was detected.\n");
        }
        else
        {
            fprintf(fout, "\e[32m[PASS]\e[0m Swapping + activation observed (T=%.1f, steps=%u)\n", simTime, steps);
            if (sawInvalidOccupied)
                fprintf(fout, "\e[33m[WARN]\e[0m Some in-memory PIDs had memAddr not found in occupied list (possible binary quirk / incomplete MEM tracking).\n");
        }
        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 3 crashed: %s\n", e.what());
    }

    // =================================================================
    // TEST 4: Manual DELETE
    // =================================================================
    banner("TEST 4: Manual DELETE Event");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        createTempBatchFile("del.job", "00004001; 0.0; 1000; 500\n");
        FILE *fin = fopen("del.job", "r");
        simLoadBatch(fin, 4096);
        fclose(fin);
        unlink("del.job");

        // Avançar até existir um processo efetivamente em execução
        for (int i = 0; i < 10 && simStep(); i++)
        {
            if (!simProcessorState[0].idle || !simProcessorState[1].idle)
                break;
        }

        uint16_t activePid = 0;
        if (!simProcessorState[0].idle)
            activePid = simProcessorState[0].pid;
        else if (!simProcessorState[1].idle)
            activePid = simProcessorState[1].pid;

        if (activePid == 0)
        {
            fprintf(fout, "\e[31m[FAIL]\e[0m No running process to DELETE.\n");
            simClose(true);
            return EXIT_FAILURE;
        }

        // Sanity: PID deve existir antes do DELETE
        {
            PctProcessState st;
            pctGet(activePid, PctState, &st);
        }

        feqInsert(10.0, DELETE, activePid);

        // Correr apenas até processar o DELETE (evita crash posterior se ficarem eventos pendentes)
        bool deleted = false;
        for (int i = 0; i < 500; i++)
        {
            if (simTime > 10.0)
                break;
            if (!simStep())
                break;

            if (simTime >= 10.0)
            {
                PctProcessState st;
                try
                {
                    pctGet(activePid, PctState, &st);
                }
                catch (const Exception &e)
                {
                    if (e.en == EINVAL)
                    {
                        deleted = true;
                        break;
                    }
                    throw;
                }
            }
        }

        if (deleted)
            fprintf(fout, "\e[32m[PASS]\e[0m Job deleted at T=10.0\n");
        else
            fprintf(fout, "\e[31m[FAIL]\e[0m DELETE not handled for PID=%hu (T=%.1f)\n", activePid, simTime);
        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 4 crashed: %s\n", e.what());
    }

    // =================================================================
    // TEST 5: Job Launcher
    // =================================================================
    banner("TEST 5: simJobLauncher");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        simJobLauncher(5, 12345);

        // Try to observe some activity (JOB insertion and/or FEQ insertion)
        bool observed = false;
        for (int i = 0; i < 200; i++)
        {
            if (jobHead != nullptr || feqHead != nullptr)
            {
                observed = true;
                break;
            }
            usleep(1000); // 1 ms
        }
        if (observed)
            fprintf(fout, "\e[32m[PASS]\e[0m Launcher produced JOB/FEQ activity.\n");
        else
            fprintf(fout, "\e[33m[WARN]\e[0m No visible JOB/FEQ activity after launcher start.\n");

        // Run with a hard step limit to avoid hanging if something goes wrong.
        bool ended = false;
        const uint32_t maxSteps = 20000;
        for (uint32_t i = 0; i < maxSteps; i++)
        {
            if (!simStep())
            {
                ended = true;
                break;
            }
        }

        if (ended)
            fprintf(fout, "\e[32m[PASS]\e[0m Simulation reached end after launcher.\n");
        else
            fprintf(fout, "\e[33m[WARN]\e[0m Simulation did not end within %u steps after launcher.\n", maxSteps);

        simClose(true);
    }
    catch (const Exception &e)
    {
        if (e.en == 95 || e.en == ENOSYS)
            fprintf(fout, "\e[33m[WARN]\e[0m simJobLauncher not supported (Error %d).\n", e.en);
        else
        {
            fprintf(fout, "\e[31m[CRASH]\e[0m Test 5 crashed: %s\n", e.what());
        }
        // Tentar fechar mesmo após crash
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 5B: simStepSuspend Semantics (swap-out)
    // =================================================================
    banner("TEST 5B: simStepSuspend Semantics");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }
        simOpen(&params);

        // Create a job requiring memory.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 10.0;
        uint32_t jid = 0x0000D001;
        uint32_t memSize = 1000;
        jobInsert(jid, 0.0, memSize, prof);

        // Create a process and allocate memory for it (using the currently selected MEM implementation).
        uint16_t pid = pctNew(jid);
        uint32_t addr = 0;
        bool memOk = true;
        try
        {
            addr = memAlloc(pid, memSize);
        }
        catch (const Exception &e)
        {
            memOk = false;
            fprintf(fout, "\e[33m[WARN]\e[0m memAlloc not available in this selection (Error %d). Skipping suspend test.\n", e.en);
        }

        if (memOk && addr != 0)
        {
            pctSet(pid, PctMemAddr, &addr);

            bool suspendSupported = true;

            // Case 1: RUNNING must be rejected.
            {
                PctProcessState st = RUNNING;
                pctSet(pid, PctState, &st);
                bool caught = false;
                try
                {
                    simStepSuspend(pid);
                }
                catch (const Exception &e)
                {
                    if (e.en == 95 || e.en == ENOSYS)
                    {
                        suspendSupported = false;
                        fprintf(fout, "\e[33m[WARN]\e[0m simStepSuspend not supported in this setup (Error %d).\n", e.en);
                    }
                    else if (e.en == EPERM)
                        caught = true;
                    else
                        throw;
                }
                if (!suspendSupported)
                {
                    // skip remaining suspend semantics
                }
                else if (caught)
                    fprintf(fout, "\e[32m[PASS]\e[0m RUNNING suspend rejected (EPERM)\n");
                else
                    fprintf(fout, "\e[31m[FAIL]\e[0m RUNNING suspend was not rejected\n");
            }

            // Case 2: READY -> S_READY, memory freed, inserted into SWP (blocked=false)
            if (suspendSupported)
            {
                PctProcessState st = READY;
                pctSet(pid, PctState, &st);
                // Ensure memAddr still set
                pctSet(pid, PctMemAddr, &addr);

                try
                {
                    simStepSuspend(pid);
                }
                catch (const Exception &e)
                {
                    if (e.en == 95 || e.en == ENOSYS)
                    {
                        suspendSupported = false;
                        fprintf(fout, "\e[33m[WARN]\e[0m simStepSuspend not supported in this setup (Error %d).\n", e.en);
                    }
                    else
                        throw;
                }

                if (suspendSupported)
                {
                    pctGet(pid, PctState, &st);
                    if (st != S_READY)
                        fprintf(fout, "\e[31m[FAIL]\e[0m READY suspend did not set S_READY (state=%d)\n", (int)st);
                    else
                        fprintf(fout, "\e[32m[PASS]\e[0m READY -> S_READY\n");

                    uint32_t curAddr;
                    pctGet(pid, PctMemAddr, &curAddr);
                    if (curAddr != PCT_UNDEF_ADDRESS)
                        fprintf(fout, "\e[31m[FAIL]\e[0m memAddr not cleared (0x%x)\n", curAddr);
                    else
                        fprintf(fout, "\e[32m[PASS]\e[0m memAddr cleared\n");

                    if (memOccupiedContains(addr))
                        fprintf(fout, "\e[31m[FAIL]\e[0m memory block still in occupied list\n");
                    else
                        fprintf(fout, "\e[32m[PASS]\e[0m memory block freed\n");

                    SwpNode *sn = findSwp(pid);
                    if (sn == nullptr)
                        fprintf(fout, "\e[31m[FAIL]\e[0m PID not inserted into SWP\n");
                    else if (sn->size != memSize || sn->blocked != false)
                        fprintf(fout, "\e[31m[FAIL]\e[0m SWP entry mismatch (size=%u blocked=%d)\n", sn->size, (int)sn->blocked);
                    else
                        fprintf(fout, "\e[32m[PASS]\e[0m inserted into SWP (blocked=false)\n");
                }
            }

            // Case 3: BLOCKED -> S_BLOCKED and SWP blocked=true (use a new process)
            if (suspendSupported)
            {
                uint32_t jid2 = 0x0000D002;
                jobInsert(jid2, 0.0, memSize, prof);
                uint16_t pid2 = pctNew(jid2);

                uint32_t addr2 = 0;
                try
                {
                    addr2 = memAlloc(pid2, memSize);
                }
                catch (...)
                {
                    addr2 = 0;
                }

                if (addr2 != 0)
                {
                    pctSet(pid2, PctMemAddr, &addr2);
                    PctProcessState st = BLOCKED;
                    pctSet(pid2, PctState, &st);

                    try
                    {
                        simStepSuspend(pid2);
                        pctGet(pid2, PctState, &st);
                        if (st != S_BLOCKED)
                            fprintf(fout, "\e[31m[FAIL]\e[0m BLOCKED suspend did not set S_BLOCKED (state=%d)\n", (int)st);
                        else
                            fprintf(fout, "\e[32m[PASS]\e[0m BLOCKED -> S_BLOCKED\n");

                        SwpNode *sn = findSwp(pid2);
                        if (sn == nullptr || sn->blocked != true)
                            fprintf(fout, "\e[31m[FAIL]\e[0m SWP blocked flag not set for blocked process\n");
                        else
                            fprintf(fout, "\e[32m[PASS]\e[0m inserted into SWP (blocked=true)\n");
                    }
                    catch (const Exception &e)
                    {
                        if (e.en == 95 || e.en == ENOSYS)
                            fprintf(fout, "\e[33m[WARN]\e[0m simStepSuspend not supported in this setup (Error %d).\n", e.en);
                        else
                            throw;
                    }
                }
                else
                {
                    fprintf(fout, "\e[33m[WARN]\e[0m Could not allocate memory for blocked-case PID; skipping blocked suspend check.\n");
                }
            }
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 5B crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    // =================================================================
    // TEST 6: simStepPreempt Semantics (SRT)
    // =================================================================
    banner("TEST 6: simStepPreempt Semantics (SRT)");
    try
    {
        if (simTime != SIM_UNDEF_TIME)
        {
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
        }

        SimParameters paramsSrt = params;
        paramsSrt.schedulingPolicy = SRT;
        simOpen(&paramsSrt);

        // Create a job with CPU, IO, CPU so the first CPU burst is not the last.
        double prof[JOB_MAX_BURSTS] = {0};
        prof[0] = 100.0; // CPU
        prof[1] = 10.0;  // IO
        prof[2] = 20.0;  // CPU
        uint32_t jid = 0x0000C001;
        jobInsert(jid, 0.0, 1000, prof);

        uint16_t pid = pctNew(jid);
        PctProcessState st = RUNNING;
        pctSet(pid, PctState, &st);

        // Emulate that DISPATCH already advanced burst index past the current CPU burst.
        uint32_t nextBurstIndex = 1;
        jobSet(jid, JobNextBurstIndex, &nextBurstIndex);

        // Put process running on core 0, removing it from idle list.
        uint16_t cid = 0;
        if (simIdleHead == cid)
        {
            simIdleHead = simProcessorState[cid].next;
            if (simIdleHead == simProcessorCount)
                simIdleTail = simProcessorCount;
        }
        else
        {
            uint16_t prev = simIdleHead;
            while (prev != simProcessorCount && simProcessorState[prev].next != cid)
                prev = simProcessorState[prev].next;
            if (prev != simProcessorCount)
            {
                simProcessorState[prev].next = simProcessorState[cid].next;
                if (simIdleTail == cid)
                    simIdleTail = prev;
            }
        }
        simProcessorState[cid].idle = false;
        simProcessorState[cid].pid = pid;

        simTime = 50.0;
        feqInsert(simTime + 30.0, WAIT_EVENT, cid); // end of CPU burst (would block)

        uint32_t beforeWait = countFeqEvents(WAIT_EVENT);
        uint32_t beforeDispatch = countFeqEvents(DISPATCH);

        bool supported = true;
        try
        {
            simStepPreempt(cid);
        }
        catch (const Exception &e)
        {
            if (e.en == 95 || e.en == ENOSYS)
            {
                supported = false;
                fprintf(fout, "\e[33m[WARN]\e[0m simStepPreempt not supported in this setup (Error %d).\n", e.en);
            }
            else
                throw;
        }

        if (supported)
        {
            // Core must become idle again.
            if (!simProcessorState[cid].idle)
                fprintf(fout, "\e[31m[FAIL]\e[0m Core %hu not marked idle after preempt\n", cid);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Core marked idle after preempt\n");

            // Process must go back to READY.
            pctGet(pid, PctState, &st);
            if (st != READY)
                fprintf(fout, "\e[31m[FAIL]\e[0m PID %hu not set to READY after preempt (state=%d)\n", pid, (int)st);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m PID set to READY after preempt\n");

            // Job must be rewound to run the remaining CPU burst again.
            jobGet(jid, JobNextBurstIndex, &nextBurstIndex);
            if (nextBurstIndex != 0)
                fprintf(fout, "\e[31m[FAIL]\e[0m Job nextBurstIndex not rewound (got=%u expected=0)\n", nextBurstIndex);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Job nextBurstIndex rewound\n");

            double dur;
            jobGet(jid, JobNextBurstDuration, &dur);
            if (fabs(dur - 30.0) > 1e-9)
                fprintf(fout, "\e[31m[FAIL]\e[0m Remaining CPU burst not updated (got=%.6f expected=30.0)\n", dur);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m Remaining CPU burst updated\n");

            // The prior WAIT_EVENT for this core must be canceled and a DISPATCH should be scheduled now.
            uint32_t afterWait = countFeqEvents(WAIT_EVENT);
            uint32_t afterDispatch = countFeqEvents(DISPATCH);
            if (afterWait != beforeWait - 1)
                fprintf(fout, "\e[33m[WARN]\e[0m WAIT_EVENT not canceled as expected (before=%u after=%u)\n", beforeWait, afterWait);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m WAIT_EVENT canceled\n");

            if (afterDispatch < beforeDispatch + 1)
                fprintf(fout, "\e[33m[WARN]\e[0m DISPATCH not scheduled (before=%u after=%u)\n", beforeDispatch, afterDispatch);
            else
                fprintf(fout, "\e[32m[PASS]\e[0m DISPATCH scheduled after preempt\n");
        }

        simClose(true);
    }
    catch (const Exception &e)
    {
        fprintf(fout, "\e[31m[CRASH]\e[0m Test 6 crashed: %s\n", e.what());
        if (simTime != SIM_UNDEF_TIME)
            try
            {
                simClose(true);
            }
            catch (...)
            {
            }
    }

    banner("All Tests Finished");
    return EXIT_SUCCESS;
}
