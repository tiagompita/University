#include <detpic32.h>

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
        // select display low
        LATD = (LATD & 0xFF9F) | 0x0020;
        // send digit_low (dl) to display: 
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8); 
    }
    else
    {
        // select display high
        LATD = (LATD & 0xFF9F) | 0x0040;
        // send digit_high (dh) to display: 
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8); 
    }
    
    displayFlag = !displayFlag;

}

int main()
{
    // Configure the A/D module and port RB4 as analog input 

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 1-1;
    AD1CHSbits.CH0SA = 4;  
    AD1CON1bits.ON = 1;  

    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;
            
    int contador = 0;
    int displaycounter = 0;
    while(1) 
    { 
        AD1CON1bits.ASAM = 1;
        while( IFS1bits.AD1IF == 0 );
        
        int freq = (ADC1BUF0 / 255) +1;

        contador = (contador == 0) ? 19 : contador - 1;

        if (displaycounter++ >= (freq / 50)) {
            send2displays(contador);
            displaycounter = 0;
        }

        // Reset AD1IF 
        IFS1bits.AD1IF = 0;
        delay(freq);
    }
    return 0;
}
