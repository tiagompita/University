#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms)
        ;
}

int main()
{
    TRISE &= 0xFFF0;

    while (1)
    {
        LATE &= 0x0000;


        char c = getChar();

        if (c == 0)
        {

        }
        else if (c == 1)
        {

        }
        else if (c == 2)
        {

        }
        else if (c == 3)
        {

        }
        else
        {
            delay(1000);
        }
    }

    return 0;
}
