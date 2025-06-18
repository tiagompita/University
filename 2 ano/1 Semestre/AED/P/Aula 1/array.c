#include <stdio.h>

void cumSum(int a[], int b[], int length)
{
    int c = 0;

    for (int i = 0; i < length; i++)
    {
        c += a[i];
        b[i] = c;
    }
}

void PrintArray(char s[], int a[], int length)
{
    printf("%s:", s);
    for (int i = 0; i < length; i++)
    {
        printf(" %d", a[i]);
    }
    printf("\n");
}

int main(void) {

    int a[] = {31,28,31,30,31,30,31,31,30,31,30,31};
    int length = sizeof(a) / sizeof(a[0]);

    PrintArray("a", a, length);

    int b[12];
    cumSum(a, b, length);
    PrintArray("b", b, length);

    return 0;
}