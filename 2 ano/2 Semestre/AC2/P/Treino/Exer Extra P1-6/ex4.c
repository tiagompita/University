#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

void send2displays(unsigned char value)
{
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (displayFlag == 0)
    {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    }
    else
    {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
    }

    displayFlag = !displayFlag;
}

int main()
{
    TRISE &= 0xFFF0;

    // configure RB8-RB14 as outputs
    // configure RD5-RD6 as outputs
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    LATE &= 0x0000;

    while (1)
    {

        char c = getChar();

        if (c == '0')
        {
            send2displays(c);
        }
        else if (c == '1')
        {
            send2displays(c);
        }
        else if (c == '2')
        {
            send2displays(c);
        }
        else if (c == '3')
        {
            send2displays(c);
        }
        else
        {
            send2displays(0xFF);
            delay(1000);
        }
        delay(10);
    }

    return 0;
}
