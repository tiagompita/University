/*
 *  \author Francisco Pires 112694
 */

#include "somm25nm.h"

namespace group
{
    void simRun(uint32_t cnt, bool blocking)
    {
        // If cnt is 0, run until the end (until simStep returns false)
        if (cnt == 0) {
            while (simStep(blocking)) {
                // Continue running until FEQ is empty
            }
        } else {
            // Run exactly cnt steps
            for (uint32_t i = 0; i < cnt; i++) {
                // If simStep returns false (FEQ empty), stop early
                if (!simStep(blocking)) {
                    break;
                }
            }
        }
    }
} // end of namespace group

