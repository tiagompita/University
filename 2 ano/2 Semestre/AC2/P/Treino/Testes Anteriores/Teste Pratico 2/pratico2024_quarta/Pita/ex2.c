#include <detpic32.h>

int freq = 0;

void delay(unsigned int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

unsigned char toBcd(unsigned char value) { 
    return ((value / 10) << 4) + (value % 10); 
}

void send2displays(unsigned char value) { 
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = toBcd(value) & 0x0F; 
    int digit_high = toBcd(value) >> 4;
    
    if (displayFlag == 0) {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8); 
    } else {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8); 
    }
    displayFlag = !displayFlag;

}

void _int_(12) isr_t3(void) {
    send2displays(freq);

    IFS0bits.T3IF = 0;
}


int main()
{
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 2-1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    //Timer 3
    T3CONbits.TCKPS = 1;
    PR3 = 39999;
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    EnableInterrupts();

    while (1)
    {
        AD1CON1bits.ASAM = 1;
        
        while(IFS1bits.AD1IF == 0);

        int *p = (int *)(&ADC1BUF0);
        int media = 0;
        for(; p <=(int *)(&ADC1BUFF); p+=4) {
            media += *p;
        }
        media /= 2;

        freq = 7 + (media * 66) / 1023;

        delay(200); //5Hz

        IFS1bits.AD1IF = 0;
    }
    
    return 0;
}
