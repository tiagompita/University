#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

void send2displays(unsigned char value) {
    static const char segments[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char flag = 0;

    int low = value & 0x0F;
    int high = value >> 4;

    if (value == 0xFF) {
        LATB &= 0x80FF;
    } else {
        if (flag == 0) {
            LATD = (LATD & 0xFF9F) | 0x0020;
            LATB = (LATB & 0x80FF) | (segments[low] << 8);
        } else {
            LATD = (LATD & 0xFF9F) | 0x0040;
            LATB = (LATB & 0x80FF) | (segments[high] << 8);
        }
    }

    
    flag = !flag;
}

int main()
{
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    // AD
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 2-1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    while(1) {
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);

        

        int *p = (int *)(&ADC1BUF0);
        int media = 0;
        for(; p <= (int *)(&ADC1BUFF); p+=4 ) { 
            media += *p;
        }
        media /= 2;
        
        printInt(media, 16 | 3 << 16);
        putChar('\r');

        int tensao = (media * 33 + 511) / 1023;
        if (tensao < 12) {
            send2displays(10);
        } else {
            send2displays(11 << 4);
        }

        delay(10);
        IFS1bits.AD1IF = 0;
    }
    
    return 0;
}
