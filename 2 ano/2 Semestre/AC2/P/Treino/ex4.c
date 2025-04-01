#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

unsigned char toBcd(unsigned char value) 
{ 
    return ((value / 10) << 4) + (value % 10); 
}

void send2displays(unsigned int val)
{

    static int segments[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
                             0x7F, 0x6F, 0x77, 0x7C, 0x39, 0xE5, 0x79, 0x71};
    static int flag = 0;

    int digitLow = toBcd(val) % 16;
    int digitHigh = toBcd(val) / 16;

    if (flag == 0)
    {
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | (segments[digitLow] << 8);
    }
    else
    {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | (segments[digitHigh] << 8);
    }
    flag = !flag;
}

int main()
{
    TRISE &= 0xFFF0;

    // configure RB8-RB14 as outputs
    TRISB &= 0x80FF;
    // configure RD5-RD6 as outputs
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
