#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int main()
{
    TRISE &= 0xFFF0;

    LATE &= 0x0000;

    while (1)
    {

        char c = getChar();

        if (c == '0')
        {
            LATE &= 0x0000;
            LATE |= 0x0001;
        }
        else if (c == '1')
        {
            LATE &= 0x0000;
            LATE |= 0x0002;
        }
        else if (c == '2')
        {
            LATE &= 0x0000;
            LATE |= 0x0004;
        }
        else if (c == '3')
        {
            LATE &= 0x0000;
            LATE |= 0x0008;
        }
        else
        {
            LATE |= 0x000F;
            delay(1000);
            LATE &= 0x0000;
        }
    }

    return 0;
}
