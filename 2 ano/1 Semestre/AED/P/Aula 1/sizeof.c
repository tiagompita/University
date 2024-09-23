#include <stdio.h>

int main(void)
{
    printf("sizeof(void *) \t %5u \n", sizeof(void *));
    printf("sizeof(void) \t %5u \n", sizeof(void));
    printf("sizeof(char) \t %5u \n", sizeof(char));
    printf("sizeof(short) \t %5u \n", sizeof(short));
    printf("sizeof(int) \t %5u \n", sizeof(int));
    printf("sizeof(long) \t %5u \n", sizeof(long));
    printf("sizeof(long long) \t %5u \n", sizeof(long long));
    printf("sizeof(float) \t %5u \n", sizeof(float));
    printf("sizeof(double) \t %5u \n", sizeof(double));
    return 0;
}
