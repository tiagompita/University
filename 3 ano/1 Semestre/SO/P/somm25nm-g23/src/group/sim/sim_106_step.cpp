/*
 *  \author Ana Santos 120039
 */

#include "somm25nm.h"

namespace group
{
    bool simStep(bool blocking)
    {
        // If the FEQ queue is empty, then the response depends on the parameter blocking:
        if (feqHead == nullptr) {
            if (!blocking){             // If it's not blocking, return false
                return false;
            }
            // If it's blocking, wait for the queue not be empty
            while (feqHead == nullptr){
                // wait
            }
        }
        else{         
            // // Retrieve event from FEQ
            double time;

            FeqEventType type;
            uint32_t xid;
            // If there is no event to retrieve in non-blocking mode, return false
            if (!feqRetrieve(&time, &type, &xid, blocking)) {
                return false;
            }

            // Advance simulation time
            simTime = time;
        
            // Process the event based on its type
            switch(type) {
                // ADMISSION event: creates a NEW process
                // Then, depending on processor availability, 
                // the new process is assigned a processor or added to the RDY queue
                case ADMIT:
                    simStepAdmit(xid);   // xid is pid
                    break;
                
                // RUNOUT event: causes a process to terminate or blocked
                case TIMEOUT:
                case EXIT:
                    simStepExit(xid);    // xid is cid (core id)
                    break;
                
                case WAIT_EVENT:
                    simStepWaitEvent(xid);
                    break;
                
                // WAKEUP event: depending on processor availability,
                // the process is assigned a processor or added to the RDY queue
                case ACTIVATE:
                    simStepActivate();
                    break;
                    
                case EVENT_OCCURS:
                    simStepEventOccurs(xid); // xid is pid
                    break;
                
                // Other possible events
                case SUBMIT:
                    simStepSubmit(xid);  // xid is jid
                    break;
                    
                case DISPATCH:
                    simStepDispatch();
                    break;
                    
                case SUSPEND:
                    simStepSuspend(xid);
                    break;
                    
                case PREEMPT:
                    simStepPreempt(xid);
                    break;
                    
                case DELETE:
                    simStepDelete(xid);
                    break;
                    
                default:
                    throw Exception(EINVAL, __func__);
            }
            
        }
        // Return true after proper processing
        return true;
    }
} // end of namespace group

