#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int main()
{
    unsigned char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    unsigned int i;
    // enable display low (RD5) and disable display high (RD6)
    // configure RD8-RD14 as outputs
    TRISB &= 0x80FF;
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;

    // Reset bit5-6 to 0   //  define bit5 = 1 and bit6 = 0
    LATD = (LATD & 0xFF9F) | 0x0020;
    while (1)
    {
        for (i = 0; i < 16; i++)
        {
            // send "segment" value to display
            LATB = (LATB & 0x80FF) | disp7Scodes[i] << 8;
            // 2Hz
            delay(500);
        }
        // toggle display selection
        // 0x0060: É a combinação dos bits RD5 (0x0020) e RD6 (0x0040)
        // XOR inverte o estado dos bits
        LATD ^= 0x0060;
    }

    return 0;
}
