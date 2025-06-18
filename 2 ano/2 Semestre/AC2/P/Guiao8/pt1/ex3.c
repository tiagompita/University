#include <detpic32.h>

volatile int cnt = 2;

int main(void)
{
    // Configure Timer T3 with interrupts enabled
    EnableInterrupts();
    T3CONbits.TCKPS = 7; // 1:256 prescaler (fout_presc = 2Hz)
    PR3 = 39062;         // PR3 value for 2 Hz (assuming 20 MHz PBCLK)
    TMR3 = 0;            // Reset Timer T3 count register
    T3CONbits.TON = 1;   // Enable Timer T3

    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag

    while (1)
    {
        IdleMode(); // CPU enters Idle mode (CPU is halted,
                    // but peripherals continue to operate)
    }
    return 0;
}
void _int_(12) isr_T3(void) // Replace VECTOR by the timer T3
                            // vector number
{
    
    if (cnt == 2)
    {
        cnt = 0;
        putChar('.');
    }
    cnt++;
    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0;
}
