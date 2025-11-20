/*
 *  \author Artur Pereira (artur at ua dot pt)
 */

#include "sim.h"
#include "binselection.h"
#include "probing.h"
#include "dbc.h"

#include <stdio.h>
#include <stdint.h>
#include <math.h>

// ================================================================================== //

/*
 * This set of supporting variables is NOT changeable
 */
double simTime = SIM_UNDEF_TIME; // The current simulation time

SimProcessorState simProcessor[SIM_N_PROCESSORS]; // The state of every processor

uint16_t simIdleHead = SIM_UNDEF_INDEX; // First idle processor to be used
uint16_t simIdleTail = SIM_UNDEF_INDEX; // Last idle processor to be used

// ================================================================================== //

namespace binary {
    void simOpen(SimParameters *param);
    void simClose(bool closeSatelliteModules);
    void simPrint(FILE *fout, bool printSatelliteModules);
    bool simStep(bool blocking);
    void simRun(uint32_t cnt, bool blocking = false);
    void simLoadBatch(FILE *fin);
    void simJobLauncher(uint32_t n, uint32_t seed);
}

namespace group {
    void simOpen(SimParameters *param);
    void simClose(bool closeSatelliteModules);
    void simPrint(FILE *fout, bool printSatelliteModules);
    bool simStep(bool blocking);
    void simRun(uint32_t cnt, bool blocking = false);
    void simLoadBatch(FILE *fin);
    void simJobLauncher(uint32_t n, uint32_t seed);
}

// ================================================================================== //

void simOpen(SimParameters *param)
{
fprintf(stderr, "simTime: %.1f\n", simTime);
    require(simTime == SIM_UNDEF_TIME, "Module must be closed");
    require(simIdleHead == SIM_UNDEF_INDEX and simIdleTail == SIM_UNDEF_INDEX, "Module must be closed");

    if (soBinSelected(101))
    {
        soProbe(SOPROBE_RED, 101, "%s(%p)\n", __func__, param);
        binary::simOpen(param);
    }
    else
    {
        soProbe(101, "%s(%p)\n", __func__, param);
        group::simOpen(param);
    }
}

// ================================================================================== //

void simClose(bool closeSatelliteModules)
{
    require(simTime != SIM_UNDEF_TIME, "Module must be open");
    require(simIdleHead != SIM_UNDEF_INDEX and simIdleTail != SIM_UNDEF_INDEX, "Module must be open");

    if (soBinSelected(102))
    {
        soProbe(SOPROBE_RED, 102, "%s(%s)\n", __func__, closeSatelliteModules ? "true" : "false");
        binary::simClose(closeSatelliteModules);
    }
    else
    {
        soProbe(102, "%s(%s)\n", __func__, closeSatelliteModules ? "true" : "false");
        group::simClose(closeSatelliteModules);
    }
}

// ================================================================================== //

void simPrint(FILE *fout, bool printSatelliteModules)
{
    require(simTime != SIM_UNDEF_TIME, "Module must be open");
    require(simIdleHead != SIM_UNDEF_INDEX and simIdleTail != SIM_UNDEF_INDEX, "Module must be open");
    require(fout != nullptr and fileno(fout) != -1, "fout must be a valid file stream");

    if (soBinSelected(103))
    {
        soProbe(SOPROBE_RED, 103, "%s(%d,%s)\n", __func__, fileno(fout), printSatelliteModules ? "true" : "false");
        binary::simPrint(fout, printSatelliteModules);
    }
    else
    {
        soProbe(103, "%s(%d,%s)\n", __func__, fileno(fout), printSatelliteModules ? "true" : "false");
        group::simPrint(fout, printSatelliteModules);
    }
}

// ================================================================================== //

bool simStep(bool blocking)
{
    require(simTime != SIM_UNDEF_TIME, "Module must be open");
    require(simIdleHead != SIM_UNDEF_INDEX and simIdleTail != SIM_UNDEF_INDEX, "Module must be open");

    if (soBinSelected(104))
    {
        soProbe(SOPROBE_RED, 104, "%s(%s)\n", __func__, blocking ? "true" : "false");
        return binary::simStep(blocking);
    }
    else
    {
        soProbe(104, "%s(%s)\n", __func__, blocking ? "true" : "false");
        return group::simStep(blocking);
    }
}

// ================================================================================== //

void simRun(uint32_t cnt, bool blocking)
{
    require(simTime != SIM_UNDEF_TIME, "Module must be open");
    require(simIdleHead != SIM_UNDEF_INDEX and simIdleTail != SIM_UNDEF_INDEX, "Module must be open");

    if (soBinSelected(105))
    {
        soProbe(SOPROBE_RED, 105, "%s(%u,%s)\n", __func__, cnt, blocking ? "true" : "false");
        binary::simRun(cnt, blocking);
    }
    else
    {
        soProbe(105, "%s(%u,%s)\n", __func__, cnt, blocking ? "true" : "false");
        group::simRun(cnt, blocking);
    }
}

// ================================================================================== //

void simLoadBatch(FILE *fin)
{
    require(simTime != SIM_UNDEF_TIME, "Module must be open");
    require(simIdleHead != SIM_UNDEF_INDEX and simIdleTail != SIM_UNDEF_INDEX, "Module must be open");
    require(fin != nullptr and fileno(fin) != -1, "fin must be a valid file stream");

    if (soBinSelected(106))
    {
        soProbe(SOPROBE_RED, 106, "%s(%d)\n", __func__, fileno(fin));
        binary::simLoadBatch(fin);
    }
    else
    {
        soProbe(106, "%s(%d)\n", __func__, fileno(fin));
        group::simLoadBatch(fin);
    }
}

// ================================================================================== //

void simJobLauncher(uint32_t n, uint32_t seed)
{
    require(simTime != SIM_UNDEF_TIME, "Module must be open");
    require(simIdleHead != SIM_UNDEF_INDEX and simIdleTail != SIM_UNDEF_INDEX, "Module must be open");

    if (soBinSelected(107))
    {
        soProbe(SOPROBE_RED, 107, "%s(%u,%u)\n", __func__, n, seed);
        binary::simJobLauncher(n, seed);
    }
    else
    {
        soProbe(107, "%s(%u,%u)\n", __func__, n, seed);
        group::simJobLauncher(n, seed);
    }
}

// ================================================================================== //

