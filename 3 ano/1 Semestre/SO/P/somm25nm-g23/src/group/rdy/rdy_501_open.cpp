/*
 *  \author Francisco Pires 112694
 */

#include "rdy.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void rdyOpen(RdySchedulingPolicy policy)
    {
        // Initialize the ready queue as empty
        rdyHead = nullptr;
        
        // Store the scheduling policy
        rdyPolicy = policy;
    }
} // end of namespace group

