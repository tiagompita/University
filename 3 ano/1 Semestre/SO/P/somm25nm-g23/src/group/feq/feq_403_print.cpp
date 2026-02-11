/*
 *  \author Tiago Pita 120152
 */

#include "feq.h"

#include "exception.h"

#include <stdio.h>
#include <stdint.h>

namespace group 
{

    static const char* feqEventTypeToString(FeqEventType type) 
    {
        switch (type) {
            case SUBMIT:       return "SUBMIT";
            case ADMIT:        return "ADMIT";
            case DISPATCH:     return "DISPATCH";
            case TIMEOUT:      return "TIMEOUT";
            case PREEMPT:      return "PREEMPT";
            case WAIT_EVENT:   return "WAIT_EVENT";
            case EVENT_OCCURS: return "EVENT_OCCURS";
            case SUSPEND:      return "SUSPEND";
            case ACTIVATE:     return "ACTIVATE";
            case EXIT:         return "EXIT";
            case DELETE:       return "DELETE";
            default:           return "UNDEF";
        }
    }
// ================================================================================== //

    void feqPrint(FILE *fout, bool csv)
    {
        if (csv) {
            fprintf(fout, "time;event;jid;pid;cid\n");

            for (FeqNode *current = feqHead; current != nullptr; current = current->next)
            {
                fprintf(fout, "%.1f;%s;", current->time, feqEventTypeToString(current->type));

                switch (current->type) {
                    case SUBMIT:
                        fprintf(fout, "0x%08x;---;---", current->xid);
                        break;

                    case ADMIT:
                    case EVENT_OCCURS:
                    case SUSPEND:
                    case DELETE: 
                        fprintf(fout, "---;%u;---", current->xid); 
                        break;

                    case PREEMPT:
                    case TIMEOUT:
                    case EXIT:
                    case WAIT_EVENT:
                        fprintf(fout, "---;---;%u", current->xid);
                        break;

                    default: // DISPATCH, ACTIVATE, UNDEF
                        fprintf(fout, "---;---;---");
                        break;
                }
                fprintf(fout, "\n");
            }
        }
        else
        {
            fprintf(fout, "\nFEQ module internal state:\n");
            FeqNode *current = feqHead;
            if (current == nullptr) {
                fprintf(fout, "  (empty)\n");
            }

            for (FeqNode *current = feqHead; current != nullptr; current = current->next)
            {
                fprintf(fout, "Time: %.1f\n", current->time);
                fprintf(fout, "  type: %s\n", feqEventTypeToString(current->type));

                switch (current->type) {
                    case SUBMIT:
                        fprintf(fout, "  JID: 0x%08x\n", current->xid);
                        break;

                    case ADMIT:
                    case EVENT_OCCURS:
                    case SUSPEND:
                    case DELETE:
                        fprintf(fout, "  PID: %u\n", current->xid);
                        break;

                    case PREEMPT:
                    case TIMEOUT:
                    case EXIT:
                    case WAIT_EVENT:
                        fprintf(fout, "  CID: %u\n", current->xid);
                        break;

                    default:
                        // DISPATCH e ACTIVATE nao imprimem ID
                        break;
                }
            }
        }

    }
// ================================================================================== //

} // end of namespace group

