#include <detpic32.h>

int counter = 0;

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

void _int_(4) isr_t1(void) {     // VECTOR number page 74-76
    counter = (counter + 1) % 100;
    IFS0bits.T1IF = 0;
}

void _int_(8) isr_t2(void) {     // VECTOR number page 74-76
    send2displays(counter);
    IFS0bits.T2IF = 0;
}

int main()
{
    //Display
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    //Timer 1
    T1CONbits.TCKPS = 2;            // K scaler
    PR1 = 31249;
    TMR1 = 0;
    T1CONbits.TON = 1;

    IPC1bits.T1IP = 2;              // Interrupt
    IEC0bits.T1IE = 1;
    IFS0bits.T1IF = 0;

    //Timer 2
    T2CONbits.TCKPS = 3;            // K scaler
    PR2 = 49999;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2;              // Interrupt
    IEC0bits.T2IE = 1;
    IFS0bits.T2IF = 0;

    EnableInterrupts();

    int freq;

    while (1)
    {
        char c = inkey();

        if (c >= 48 && c <= 51) {
            freq = 2 * (1 + (c - 48));
            printStr("Nova frequencia:");
            printInt10(freq);
            putChar('\n');
        }

        printInt(counter, 16 | 2 << 16);
        putChar('\r');
    }
    

    return 0;
}
