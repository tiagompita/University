#include <stdio.h>

unsigned char grayToBinary(unsigned char gray)
{
    unsigned char num = gray;
    unsigned char temp;

    temp = num >> 4;
    num = num ^ temp;

    temp = num >> 2;
    num = num ^ temp;

    temp = num >> 1;
    num = num ^ temp;

    return num;
}

int main()
{
    unsigned char gray = 100; // Set gray to 100
    unsigned char bin = grayToBinary(gray);

    printf("Gray code: %d\n", gray);
    printf("Binary: %d\n", bin);

    return 0;
}