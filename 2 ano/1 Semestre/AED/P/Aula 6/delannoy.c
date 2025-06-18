#include <stdio.h>
#include <time.h>

long long nADDs = 0;
long long nRecursiv = 0;

long long delannoy(int m, int n) {
    nRecursiv++;
    if (m == 0 || n == 0)
        return 1;
    else {
        nADDs += 2;
        return delannoy(m-1, n) + delannoy(m-1 , n-1) + delannoy(m, n-1);
    }
}

int main()
{
    printf("Dellanoy number computation for (N,N)\n");
    printf("N // Dellanoy(N,N) // Num. Recursive Calls // Num. Additions // Time(s)\n\n");
    for (int i = 0; i < 14; i++) {
        nADDs = 0;
        nRecursiv = 0;
        struct timespec start, end;
        clock_gettime(CLOCK_MONOTONIC, &start);
        long long result = delannoy(i, i);
        clock_gettime(CLOCK_MONOTONIC, &end);
        double time_spent = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
        printf("n= %3d  // DEL= %10lld  // Recursive_Calls= %10lld  // nAdds= %10lld  // Time= %.9f\n", i, result, nRecursiv, nADDs, time_spent);
    } 
    return 0;
}