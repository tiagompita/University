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
        // select display low
        LATD = (LATD & 0xFF9F) | 0x0020;
        // send digit_low (dl) to display: 
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8); 
    }
    else
    {
        // select display high
        LATD = (LATD & 0xFF9F) | 0x0040;
        // send digit_high (dh) to display: 
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8); 
    }
    
    displayFlag = !displayFlag;

}

int main()
{
    TRISE &= 0xFFF0;
    LATE &= 0x0000;

    // configure RB8-RB14 as outputs
    // configure RD5-RD6 as outputs
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;
    while (1)
    {

        char c = getChar();
        unsigned char displayValue;

        if (c == '0')
        {
            LATE &= 0x0000;
            LATE |= 0x0001;
            displayValue = 0x00;
        }
        else if (c == '1')
        {
            LATE &= 0x0000;
            LATE |= 0x0002;
            displayValue = 0x01;
        }
        else if (c == '2')
        {
            LATE &= 0x0000;
            LATE |= 0x0004;
            displayValue = 0x02;
        }
        else if (c == '3')
        {
            LATE &= 0x0000;
            LATE |= 0x0008;
            displayValue = 0x03;
        }
        else
        {
            LATE |= 0x000F;
            displayValue = 0xFF;
            int i;
            for(i = 0; i < 100; i++) {
                send2displays(displayValue);
                delay(10);
            }
            LATE &= 0x0000;
        }

        int i;
        for (i = 0; i < 100; i++) {
            send2displays(displayValue);
            delay(10);
        }
    }

    return 0;
}
