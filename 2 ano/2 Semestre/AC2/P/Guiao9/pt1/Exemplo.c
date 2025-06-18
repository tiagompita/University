#include <detpic32.h>

int main()
{
    // Sinal de 10 Hz e duty-cycle de 20% na saída OC1

    T2CONbits.TCKPS = 5;        // 1:32 prescaler (i.e Fout_presc = 625 KHz)
    PR2 = 62499;                // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz
    TMR2 = 0;                   // Reset timer T2 count register
    T2CONbits.TON = 1;          // Enable timer T2 (must be the last command of the
                                // timer configuration sequence)
    OC1CONbits.OCM = 6;         // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 0;      // Use timer T2 as the time base for PWM generation
    OC1RS = 12500;              // Ton constant
    OC1CONbits.ON = 1;          // Enable OC1 module
    return 0;
}
