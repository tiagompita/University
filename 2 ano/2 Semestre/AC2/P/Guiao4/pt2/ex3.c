#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms ); //2Hz
}

int main() {

    unsigned char segment;
    unsigned int i; 
    // configure RD8-RD14 as outputs
    TRISB &= 0x80FF;
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;

    // enable display low (RD5) and disable display high (RD6)
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;
    while (1) {
        segment = 1;
        for (i = 0; i < 7; i++) { 
            // send "segment" value to display
            LATB = (LATB & 0x80FF) | segment << 8;
            // wait 0.5s
            delay(500);
            segment = segment << 1;
        }
        //toggle display selection
        LATDbits.LATD5 = !LATDbits.LATD5; 
        LATDbits.LATD6 = !LATDbits.LATD6; 
    }

    
    return 0;
}