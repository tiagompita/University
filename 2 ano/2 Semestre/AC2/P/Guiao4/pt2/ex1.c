#include <detpic32.h>

int main()
{
    // Port B as output (&)
    // Bits 14-8
    TRISB &= 0x80FF;
    
    //Port D as output (&)
    // Bits 6-5
    TRISD &= 0xFF9F;

    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;

    while (1) LATB = (LATB & 0x80FF) | 0x0100 << (getChar() - 'a');

    return 0;
}
