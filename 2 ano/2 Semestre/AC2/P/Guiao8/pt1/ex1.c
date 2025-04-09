#include <detpic32.h>

int main()
{
    // Configure Timer T3 (2 Hz with interrupts disabled)
    T3CONbits.TCKPS = 7;    // 1:256 prescaler (fout_presc = 2Hz)
    PR3 = 39062;            // PR3 value for 2 Hz (assuming 20 MHz PBCLK)
    TMR3 = 0;               // Reset Timer T3 count register
    T3CONbits.TON = 1;      // Enable Timer T3

    while (1)
    {
        // Wait while T3IF = 0
        while (IFS0bits.T3IF == 0);
        // Reset T3IF
        IFS0bits.T3IF = 0;
        putChar('.');
    }
    return 0;
}
