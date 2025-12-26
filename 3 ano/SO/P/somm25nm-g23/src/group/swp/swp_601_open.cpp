/*
 *  \author Francisco Pires 112694
 */

#include "swp.h"
#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group
{
    void swpOpen(SwpSwappingPolicy policy)
    {
        // Initialize the swapped-out queue as empty
        swpHead = nullptr;
        swpTail = nullptr;
        
        // Store the swapping-in policy
        swpPolicy = policy;
    }
} // end of namespace group
