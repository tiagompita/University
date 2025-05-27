#include <detpic32.h>

void setPWM(unsigned int dutyCycle) {

    if (dutyCycle <= 100) {
        OC1RS = ((PR3 +1) * dutyCycle) / 100;
    } else {
        printf("Valor do dutyCycle fora do intervalo.");
        return;
    }
}

int main(void)
{
    // Configure Timer T3
    T3CONbits.TCKPS = 2;    // 1:4 prescaler (i.e Fout_presc = 5 MHz)
    PR3 = 49999;            // Fout = 5MHz / (49999 +1) = 100 Hz
    TMR3 = 0;               // Reset timer T3 count register
    T3CONbits.TON = 1;      // Enable timer T3 (must be the last command of the
                            // timer configuration sequence)

    // Configure Output Compare Module 1 (OC1)
    OC1CONbits.OCM = 6;     // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 1;  // Use timer T3 as the time base for PWM generation
                            // OCTSEL: Output Compare Timer Select bit
                            // 1 = Timer3 is the clock source for this Output Compare module
                            // 0 = Timer2 is the clock source for this Output Compare module
    setPWM(1);              // Ton constant     Duty Cycle 25%
    OC1CONbits.ON = 1;      // Enable OC1 module

    // res = log2(PR2 +1 ) = 15 bits

    // 1011 1111 1111 1111
    TRISC &= 0xBFFF;
    while (1)
    {
        LATCbits.LATC14 = PORTDbits.RD0;
    }
    return 0;
}
