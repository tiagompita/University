#include <stdio.h>
#include <time.h>

long long nADDs = 0;
long long nRecursiv = 0;

long long delannoy(int m, int n) {
    long long data[m+1][n+1];
    
    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (i == 0 || j == 0)
                data[i][j] = 1;
            else {
                data[i][j] = data[i-1][j] + data[i-1][j-1] + data[i][j-1];
                nADDs += 2; 
            }
        }
    }

    return data[m][n];
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

        printf("n= %3d  // DEL= %10lld  // Recursive_Calls= %10lld  // nAdds= %10lld  // Time= %.9f s\n", i, result, nRecursiv, nADDs, time_spent);
    } 
    return 0;
}