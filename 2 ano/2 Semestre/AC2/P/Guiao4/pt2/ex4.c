#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms)
        ; // 2Hz
}

int main()
{

    unsigned char segment;
    unsigned int i;
    // enable display low (RD5) and disable display high (RD6)
    // configure RD8-RD14 as outputs
    TRISB &= 0x80FF;
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;

    // Reset bit5-6 to 0   //  define bit5 = 0 and bit6 = 1
    LATD = (LATD & 0xFF9F) | 0x0040;
    while (1)
    {
        segment = 1;
        for (i = 0; i < 7; i++)
        {
            // send "segment" value to display
            LATB = (LATB & 0x80FF) | segment << 8;
            // wait 0.5s
            delay(500);
            segment = segment << 1;
        }
        // toggle display selection
        // 0x0060: É a combinação dos bits RD5 (0x0020) e RD6 (0x0040)
        // XOR inverte o estado dos bits
        LATD ^= 0x0060;
    }

    return 0;
}
