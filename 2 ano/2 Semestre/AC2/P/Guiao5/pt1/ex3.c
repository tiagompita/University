#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

void send2displays(unsigned char value) 
{ 
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    // static variable: doesn't loose its
    // value between calls to function
    static char displayFlag = 0;

    int digit_low = value & 0x0F; 
    int digit_high = value >> 4;
    
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

int main(void) 
{ 
    // configure RB8-RB14 as outputs
    TRISB &=  0x80FF;
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;
    while(1) 
    { 
        send2displays(0x15); 
        // wait 0.2s
        delay(200); 
    }
    return 0; 
}