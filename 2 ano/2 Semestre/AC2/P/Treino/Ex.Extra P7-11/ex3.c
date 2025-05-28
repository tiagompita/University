#include <detpic32.h>
#define N 1

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value)
{
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = toBcd(value) & 0x0F;
    int digit_high = toBcd(value) >> 4;

    if (displayFlag == 0)
    {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    }
    else
    {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

void setPWM(int dutycycle) {
    OC3RS = ((PR3 + 1) * dutycycle) / 100;
}

int main()
{
    // Display
    TRISB &= 0x80FF;
    TRISD &= 0xF79F;

    // Timer 1
    T3CONbits.TCKPS = 0; // K scaler
    PR3 = 19999;
    TMR3 = 0;
    T3CONbits.TON = 1;

    OC3CONbits.OCM = 6;
    OC3CONbits.OCTSEL = 1;
    OC3CONbits.ON = 1;

    //ADC
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = N-1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1; 

    AD1CON1bits.ASAM = 1;

    while (1)
    {
        while (IFS1bits.AD1IF == 0); // polling
        delay(100);

        int dutycycle = ((ADC1BUF0 * 100 + 511) / 1023);

        setPWM(dutycycle);

        send2displays(dutycycle);
        printInt10(dutycycle);

        if (dutycycle == 100) {
            LATDbits.LATD11 = 1;
        }

        IFS1bits.AD1IF = 0;
    }

    return 0;
}
