#include <detpic32.h>

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

int main()
{
    // declare variables 
    unsigned int counter = 0;
    unsigned int i;

    // initialize ports
    // configure RB8-RB14 as outputs and RB0 as input
    TRISB = (TRISB & 0x80FF) | 0x0001;
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;

    while(1) 
    { 
        // Only keep RB0
        PORTB &= 0x0001;
        i = 0; 
        do 
        { 
            send2displays(counter); 
            // wait 10ms
            delay(10); 
        } while(i++ < (PORTBbits.RB0 == 1 ? 20 : 50)); // 50 * 10 ms = 500 ms (2Hz)

        if (PORTBbits.RB0 == 1)
        {
            // increment counter (mod 256)
            counter = (counter + 1) % 60; 
        }
        else
        {
            // increment counter (mod 256)
            counter = (counter - 1 + 60) % 60; 
        }
        
    } 

    return 0;
}
