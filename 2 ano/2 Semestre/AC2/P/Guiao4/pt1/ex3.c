#include <detpic32.h>

void delay()
{
    resetCoreTimer();
    while (readCoreTimer() < 7407407);
}

int main()
{
    // Configure RE6-RE3 as output
    // 1111 1111 1000 0111
    TRISE &= 0xFF87;

    unsigned int counter = 0;

    while (1)
    {
        LATE = (LATE & 0xFF87) | counter << 3;

        delay();

        counter = counter > 0 ? counter - 1 : 9;

        // Print current value
        printStr("RE6-RE3: ");
        printInt10(LATE >> 3);
        putChar('\r');
    }
}
