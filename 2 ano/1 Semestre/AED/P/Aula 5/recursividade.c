#include <stdio.h>
#include <assert.h>

int N1,N2,N3;

int f1(int n) {
    assert(n >= 1);
    if (n == 1) {
        return 1;
    } else {
        N1++;
        return n + f1(n/2);
    }

}

int f2(int n) {
    assert(n >=1);

    if (n == 1) {
        return 1;
    } else {
        N2 += 2;
        return n + f2(n/2) + f2((n+1)/2);
    }
}

int f3(int n) {
    assert(n >= 1);

    if (n == 1) {
        return 1;
    } else if (n % 2 == 0) //numero par
    {
        N3++;
        return n + 2 * f3(n / 2);
    } else {
        N3 += 2;
        return n + f3(n / 2) + f3((n + 1) / 2);
    }
    
}

int main(void)
{
    for (int i = 1; i < 128; i++) {
        N1 = 0; N2 = 0; N3 = 0;
        int r1 = f1(i);
        int r2 = f2(i);
        int r3 = f3(i);

        printf("N= %4d | f1= %4d, N1= %4d | f2= %4d, N2= %4d | f3= %4d, N3= %4d \n", i, r1, N1, r2, N2, r3, N3);
    }
    return 0;
}
