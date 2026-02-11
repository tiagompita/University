/*
 *  \author Rafael Caçador 107370
 */

#include "somm25nm.h"

#include <pthread.h>
#include <unistd.h>

#include <stdint.h>
#include <stdlib.h>

namespace group
{
    struct JobLauncherArgs
    {
        uint32_t n;
        uint32_t seed;
    };

    static inline uint32_t lcgNext(uint32_t *state)
    {
        // Simple deterministic PRNG (LCG) to avoid non-deterministic rand().
        *state = (*state * 1103515245u) + 12345u;
        return *state;
    }

    static inline double uniform01(uint32_t *state)
    {
        // Map to [0,1) using 24 bits for stable results.
        return (double)(lcgNext(state) & 0x00ffffffu) / (double)0x01000000u;
    }

    static void *jobLauncherThread(void *vp)
    {
        JobLauncherArgs *args = (JobLauncherArgs *)vp;
        const uint32_t n = args->n;
        uint32_t rng = args->seed;
        free(args);

        try
        {
            const uint32_t biggest = memBiggestFreeBlock();
            const uint32_t minMem = (biggest > 0) ? (biggest / 8u ? biggest / 8u : 1u) : 1024u;
            const uint32_t maxMem = (biggest > 0) ? biggest : 4096u;

            double t = 0.0;
            for (uint32_t i = 0; i < n; i++)
            {
                const uint32_t jid = 0x10000000u + i;

                // Ascending submission times (required by simLoadBatch rules; we keep the same discipline here)
                t += uniform01(&rng); // delta in [0,1)

                // Memory size in [minMem, maxMem]
                const uint32_t memSize = minMem + (uint32_t)(uniform01(&rng) * (double)(maxMem - minMem + 1u));

                // Burst profile: odd number of positive real durations, up to JOB_MAX_BURSTS
                double profile[JOB_MAX_BURSTS] = {0};
                const int cpuBursts = 1 + (int)(uniform01(&rng) * (double)JOB_MAX_CPU_BURSTS);
                const int totalBursts = 2 * cpuBursts - 1;
                for (int b = 0; b < totalBursts; b++)
                {
                    const double u = uniform01(&rng);
                    if ((b % 2) == 0)
                    {
                        // CPU burst in [0.2, 4.0]
                        profile[b] = 0.2 + u * (4.0 - 0.2);
                    }
                    else
                    {
                        // IO burst in [0.2, 3.0]
                        profile[b] = 0.2 + u * (3.0 - 0.2);
                    }
                }

                jobInsert(jid, t, memSize, profile);
                feqInsert(t, SUBMIT, jid);

                // Small delay so the main thread can observe concurrent activity.
                usleep(1000);
            }
        }
        catch (...)
        {
            // Best-effort feeder: do not let exceptions escape a pthread entrypoint.
        }

        return nullptr;
    }

    void simJobLauncher(uint32_t n, uint32_t seed)
    {
        // NOTE: `sim.h` explicitly requires this function to *launch a thread* that
        // concurrently feeds the JOB and FEQ queues.

        pthread_t tid;

        JobLauncherArgs *args = (JobLauncherArgs *)malloc(sizeof(JobLauncherArgs));
        if (args == nullptr)
        {
            throw Exception(ENOMEM, __func__);
        }
        args->n = n;
        args->seed = seed;

        const int rc = pthread_create(&tid, nullptr, jobLauncherThread, args);
        if (rc != 0)
        {
            free(args);
            throw Exception(rc, __func__);
        }
        pthread_detach(tid);
    }
} // end of namespace group

