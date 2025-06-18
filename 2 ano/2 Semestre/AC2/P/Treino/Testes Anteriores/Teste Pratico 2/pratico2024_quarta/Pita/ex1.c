#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

void setPWM(int dutycycle) {
    OC4RS = ((PR3 + 1) * dutycycle) / 100;
}

int main()
{

    TRISB |= 0x0002;

    T3CONbits.TCKPS = 2;
    PR3 = 38460;
    TMR3 = 0;
    T3CONbits.TON = 1;

    OC4CONbits.OCM = 6;
    OC4CONbits.OCTSEL = 1;
    setPWM(50);
    OC4CONbits.ON = 1;

    while (1)
    {
        if (LATBbits.LATB1 == 0) {
            setPWM(25);
            delay(1300);
            setPWM(75);
        }
    }
    
    return 0;
}
