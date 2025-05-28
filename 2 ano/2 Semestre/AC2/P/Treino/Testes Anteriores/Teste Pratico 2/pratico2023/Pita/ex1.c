#include <detpic32.h>

void delay(unsigned int us) {
    resetCoreTimer();
    while(readCoreTimer() < 20 * us);
}

void setPWM(unsigned int dutycycle) {
    OC2RS = ((PR3 + 1) * dutycycle)/100;
}

int main()
{
    // 0101
    TRISB |=0x0005;

    T3CONbits.TCKPS = 2;
    PR3 = 41665;
    TMR3 = 0;
    T3CONbits.TON = 1;

    OC2CONbits.OCM = 6;
    OC2CONbits.OCTSEL = 1;
    setPWM(75);
    OC1CONbits.ON = 1;

    while (1)
    {
        if (PORTBbits.RB2 == 0 && PORTBbits.RB0 == 0) {
            setPWM(30);
        } else if (PORTBbits.RB2 == 1 && PORTBbits.RB0 == 1) {
            setPWM(55);
        }
        delay(360);
    }
    
    return 0;
}
