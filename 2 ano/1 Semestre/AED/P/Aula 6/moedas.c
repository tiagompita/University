#include <stdio.h>
#include <time.h>

static int coins[] = {5, 1, 2, 10, 6, 2, 7, 8, 3, 6, 8, 44, 3, 24, 56, 66, 23, 8, 9, 5, 1, 2, 10, 6, 2, 7, 8, 3, 6, 8, 44, 3, 24, 56, 66, 23, 8, 9, 10, 2};

long long nADDs = 0;
long long nRecursiv = 0;

long long Val(int n)
{
    nRecursiv++;

    if (n == 0) return 0;
    if (n == 1) return coins[0];

    long long val1 = coins[n] + Val(n-2);
    nADDs +=1;
    long long val2 = Val(n-1);

    if (val1 < val2)
        return val2;
    else
        return val1;
}

int main()
{
    printf("The Row Coin Problem\n");
    printf("N // V(N) // Num. Recursive Calls // Num. Additions // Time(s)\n\n");
    for (int i = 0; i < sizeof(coins)/sizeof(coins[0]); i++)
    {
        nADDs = 0;
        nRecursiv = 0;
        struct timespec start, end;
        clock_gettime(CLOCK_MONOTONIC, &start);

        long long result = Val(i);

        clock_gettime(CLOCK_MONOTONIC, &end);
        double time_spent = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
        printf("n= %3d  // V(n)= %10lld  // Recursive_Calls= %10lld  // nAdds= %10lld  // Time= %.9f\n", i, result, nRecursiv, nADDs, time_spent);
    }
    return 0;
}