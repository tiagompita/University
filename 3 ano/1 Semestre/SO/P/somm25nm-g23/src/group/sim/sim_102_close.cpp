/*
 *  \author Daniel Oliveira 115359
 */

#include "somm25nm.h"

namespace group 
{
    void simClose(bool closeSatelliteModules) 
    {
        // If requested, close all satellite modules
        if (closeSatelliteModules)
        {
            memClose();
            swpClose();
            rdyClose();
            feqClose();
            pctClose();
            jobClose();
        }

        // Free dynamically allocated memory
        delete[] simProcessorState;

        // Reset module variables to closed state
        simTime = SIM_UNDEF_TIME;
        simProcessorCount = 0;
        simProcessorState = SIM_UNDEF_POINTER;
        simIdleHead = SIM_UNDEF_INDEX;
        simIdleTail = SIM_UNDEF_INDEX;
    }
} // end of namespace group

