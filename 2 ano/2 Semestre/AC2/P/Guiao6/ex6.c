#include <detpic32.h>

#define SAMPLES 4

void delay(unsigned int ms)
{
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
    // static variable: doesn't loose its
    // value between calls to function
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

int main(void) { 
    // Configure the A/D module and port RB4 as analog input 

    TRISBbits.TRISB4 = 1;           // RB4 digital output disconnected 
    AD1PCFGbits.PCFG4= 0;           // RB4 configured as analog input 
    AD1CON1bits.SSRC = 7;           // Conversion trigger selection bits: in this 
                                    //  mode an internal counter ends sampling and 
                                    //  starts conversion 
    AD1CON1bits.CLRASAM = 1;        // Stop conversions when the 1st A/D converter 
                                    //  interrupt is generated. At the same time, 
                                    //  hardware clears the ASAM bit 
    AD1CON3bits.SAMC = 16;          // Sample time is 16 TAD (TAD = 100 ns) 
    AD1CON2bits.SMPI = SAMPLES-1;   // Interrupt is generated after N samples 
                                    //  (replace N by the desired number of 
                                    //  consecutive samples) 
    AD1CHSbits.CH0SA = 4;           // replace x by the desired input  
                                    //  analog channel (0 to 15) 
    AD1CON1bits.ON = 1;             // Enable A/D converter 
                                    //  This must the last command of the A/D 
                                    //  configuration sequence

    // configure RB8-RB14 as outputs and RB0 as input
    TRISB = (TRISB & 0x80FF) | 0x0001;
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;

    int i = 0;
    int V = 0;

    while(1) 
    { 
        if (i == 0) {
            // Start conversion 
            AD1CON1bits.ASAM = 1;
            // Wait while conversion not done (AD1IF == 0) 
            while( IFS1bits.AD1IF == 0 );
            // Read conversion result (ADC1BUF0 value) and print it 

            int *p = (int *)(&ADC1BUF0);
            int media = 0;
            for(; p <= (int *)(&ADC1BUFF); p+=4 ) { 
                media += *p;
            }
            media /= SAMPLES;
            
            V = (media * 33 + 511) / 1023;

            printStr("VAL_AD: ");
            printInt(media, 10 | 4 << 16);
            printStr(" | V: ");
            printInt(V, 10 | 4 << 16);
            putChar('\r');
            // Reset AD1IF 
            IFS1bits.AD1IF = 0;
        }
        // Send voltage value to displays
        send2displays(V);
        // Wait 10 ms (using the core timer)
        delay(10);


        i = (i + 1) % 20;

    } 
    return 0; 
}
