/*
 *  \author Ana Santos 120039
 */

#include "job.h"
#include "exception.h"

#include <stdint.h>
#include <stdio.h>

namespace group
{

// ================================================================================== //

    void jobClose()
    {
        delete jobHead;
        jobHead = JOB_UNDEF_NODE; // address indicating it closed
    }

// ================================================================================== //

} // end of namespace group

