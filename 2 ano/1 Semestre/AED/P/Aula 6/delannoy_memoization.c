#include <stdio.h>
#include <time.h>
#define MAX 50

static long long delannoy_cache[MAX+1][MAX+1] = {{0}};

long long nADDs = 0;
long long nRecursiv = 0;

long long delannoy(int m, int n)
{
    if (delannoy_cache[m][n] != 0)
        return delannoy_cache[m][n];

    long long r;
    if ((m == 0) || (n == 0))
        r = 1;
    else {
        nADDs += 2;
        nRecursiv += 3;
        r = delannoy(m-1, n) + delannoy(m-1,n-1) + delannoy(m, n-1);
    }    

    delannoy_cache[m][n] = r;
    return r;
}

int main()
{
    printf("Dellanoy number computation for (N,N)\n");
    printf("N // Dellanoy(N,N) // Num. Recursive Calls // Num. Additions // Time(s)\n\n");
    for (int i = 0; i < 17; i++)
    {
        nADDs = 0;
        nRecursiv = 0;

        struct timespec start, end;
        clock_gettime(CLOCK_MONOTONIC, &start);

        long long result = delannoy(i, i);

        clock_gettime(CLOCK_MONOTONIC, &end);
        double time_spent = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

        printf("n= %3d  // DEL= %15lld  // Recursive_Calls= %10lld  // nAdds= %10lld  // Time= %.9f s\n", i, result, nRecursiv, nADDs, time_spent);
    }
    return 0;
}