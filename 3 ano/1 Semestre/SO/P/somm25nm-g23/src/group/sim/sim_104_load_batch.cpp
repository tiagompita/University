/*
 *  \author Rafael Caçador 107370
 */

#include "somm25nm.h"

#include <stdio.h>
#include <ctype.h>
#include <errno.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

namespace group
{
    static char *ltrim(char *s)
    {
        while (*s && isspace((unsigned char)*s))
            s++;
        return s;
    }

    static void rtrim_inplace(char *s)
    {
        size_t n = strlen(s);
        while (n > 0 && isspace((unsigned char)s[n - 1]))
        {
            s[n - 1] = '\0';
            n--;
        }
    }

    static bool isBlankLine(const char *s)
    {
        while (*s)
        {
            if (!isspace((unsigned char)*s))
                return false;
            s++;
        }
        return true;
    }

    static void parseErrorSemantic(uint32_t lineNo, const char *msg)
    {
        fprintf(stderr, "simParse: semantic error at line %u: %s.\n", lineNo, msg);
        throw Exception(EINVAL, "simLoadBatch");
    }

    static void parseErrorSyntax(uint32_t lineNo, const char *msg)
    {
        fprintf(stderr, "simParse: syntax error at line %u: %s.\n", lineNo, msg);
        throw Exception(EINVAL, "simLoadBatch");
    }

    void simLoadBatch(FILE *fin, uint32_t maxMemSize)
    {
        errno = 0;

        char line[1024];
        uint32_t lineNo = 0;
        double lastSubmission = -1.0;

        while (fgets(line, sizeof(line), fin) != nullptr)
        {
            lineNo++;

            // Strip newline and surrounding whitespace
            rtrim_inplace(line);
            char *p = ltrim(line);

            if (*p == '\0' || isBlankLine(p))
                continue;
            if (*p == '%')
                continue;

            // Split into 4 semicolon-separated fields:
            // jid ; submissionTime ; memSize ; burstProfile
            char *fields[4] = {nullptr, nullptr, nullptr, nullptr};
            int fcnt = 0;
            char *cur = p;
            while (fcnt < 4)
            {
                fields[fcnt++] = cur;
                char *semi = strchr(cur, ';');
                if (semi == nullptr)
                    break;
                *semi = '\0';
                cur = semi + 1;
                cur = ltrim(cur);
            }
            if (fcnt < 4)
                parseErrorSyntax(lineNo, "expected 4 ';' separated fields");

            // Trim each field
            for (int i = 0; i < 4; i++)
            {
                fields[i] = ltrim(fields[i]);
                rtrim_inplace(fields[i]);
                if (fields[i][0] == '\0')
                    parseErrorSyntax(lineNo, "empty field");
            }

            // Field 1: job id (8 hex digits)
            const char *jidStr = fields[0];
            if (strlen(jidStr) != 8)
                parseErrorSyntax(lineNo, "bad job id");
            for (size_t i = 0; i < 8; i++)
                if (!isxdigit((unsigned char)jidStr[i]))
                    parseErrorSyntax(lineNo, "bad job id");

            char *end = nullptr;
            errno = 0;
            uint32_t jid = (uint32_t)strtoul(jidStr, &end, 16);
            if (errno != 0 || end == nullptr || *end != '\0')
                parseErrorSyntax(lineNo, "bad job id");

            // Field 2: submission time (non-negative real, ascending)
            errno = 0;
            end = nullptr;
            double submission = strtod(fields[1], &end);
            if (errno != 0 || end == fields[1])
                parseErrorSemantic(lineNo, "bad submission time");
            while (end && isspace((unsigned char)*end))
                end++;
            if (end == nullptr || *end != '\0')
                parseErrorSemantic(lineNo, "bad submission time");
            if (!(submission >= 0.0))
                parseErrorSemantic(lineNo, "bad submission time");
            if (lastSubmission >= 0.0 && submission < lastSubmission)
                parseErrorSemantic(lineNo, "bad submission time");
            lastSubmission = submission;

            // Field 3: memory size (positive integer, must fit maxMemSize)
            errno = 0;
            end = nullptr;
            unsigned long memSizeUL = strtoul(fields[2], &end, 0);
            if (errno != 0 || end == fields[2])
                parseErrorSemantic(lineNo, "bad memory size");
            while (end && isspace((unsigned char)*end))
                end++;
            if (end == nullptr || *end != '\0')
                parseErrorSemantic(lineNo, "bad memory size");
            if (memSizeUL == 0)
                parseErrorSemantic(lineNo, "bad memory size");
            if (maxMemSize != 0 && memSizeUL > maxMemSize)
                parseErrorSemantic(lineNo, "bad memory size");
            uint32_t memSize = (uint32_t)memSizeUL;

            // Field 4: burst profile (comma-separated positive reals, odd count, <= JOB_MAX_BURSTS)
            double bursts[JOB_MAX_BURSTS] = {0};
            uint32_t bcnt = 0;
            char *prof = fields[3];
            char *q = prof;
            while (*q)
            {
                // Skip spaces and commas
                while (*q && (isspace((unsigned char)*q) || *q == ','))
                    q++;
                if (!*q)
                    break;

                errno = 0;
                end = nullptr;
                double v = strtod(q, &end);
                if (errno != 0 || end == q)
                    parseErrorSemantic(lineNo, "bad burst profile");
                if (!(v > 0.0))
                    parseErrorSemantic(lineNo, "bad burst profile");
                if (bcnt >= JOB_MAX_BURSTS)
                    parseErrorSemantic(lineNo, "bad burst profile");
                bursts[bcnt++] = v;
                q = end;

                // After a number, allow spaces, then either ',' or end.
                while (*q && isspace((unsigned char)*q))
                    q++;
                if (*q == ',')
                    q++;
                else if (*q == '\0')
                    break;
                else
                    parseErrorSemantic(lineNo, "bad burst profile");
            }

            if (bcnt == 0 || (bcnt % 2) == 0)
                parseErrorSemantic(lineNo, "bad burst profile");

            // Insert into JOB and schedule corresponding SUBMIT in FEQ.
            // (The FEQ event triggers simStepSubmit which then creates a process and schedules ADMIT.)
            try
            {
                jobInsert(jid, submission, memSize, bursts);
                feqInsert(submission, SUBMIT, jid);
            }
            catch (const Exception &e)
            {
                if (e.en == EINVAL)
                {
                    parseErrorSemantic(lineNo, "duplicated job id");
                }
                throw;
            }
        }

        if (ferror(fin))
        {
            throw Exception(errno ? errno : EIO, __func__);
        }
    }
} // end of namespace group

