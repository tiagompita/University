#include <detpic32.h>

int main(void)
{
    // Configure Timers T1 and T3 with interrupts enabled)
    // Reset T1IF and T3IF flags
    EnableInterrupts(); // Global Interrupt Enable

    T1CONbits.TCKPS = 6;    // 1:64 prescaler (fout_presc = 5Hz)
    PR1 = 62500;            // PR1 value for 5 Hz (assuming 20 MHz PBCLK)
    TMR1 = 0;               // Reset Timer T1 count register
    T1CONbits.TON = 1;      // Enable Timer T1

    IPC1bits.T1IP = 2;      // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1;      // Enable timer T1 interrupts
    IFS0bits.T1IF = 0;      // Reset timer T1 interrupt flag

    // T3CONbits.TCKPS = 4;    // 1:16 (fout_presc = 25Hz)
    // PR3 = 50000;            // PR3 value for 25Hz
    T3CONbits.TCKPS = 3;    // 1:8 (fout_presc = 50Hz)
    PR3 = 50000;            // PR3 value for 50Hz
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    while (1)
    {
        IdleMode();
    }
    return 0;
}
void _int_(4) isr_T1(void)
{
    // print character '1'
    putChar('1');
    // Reset T1IF flag
    IFS0bits.T1IF = 0;
}
void _int_(12) isr_T3(void)
{
    // print character '3'
    putChar('3');
    // Reset T3IF flag
    IFS0bits.T3IF = 0;
}
