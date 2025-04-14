#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

void send2displays(unsigned char value) {
    static const char segments[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char flag = 0;

    int low = value & 0x0F;
    int high = value >> 4;


    if(flag == 0) {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | (segments[low] << 8);
    } else {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | (segments[high] << 8);
    }
    
    flag = !flag;
}

int main()
{
    //Config Display
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    int display = 0, reset = 1, f = 0;

    while (1) {
        char c = inkey();

        char lastkey = 0;
        if (lastkey != c) {
            if (c >= '0' && c <= '3') {
                display = (c - '0');
                f = 0;
                reset = 0;
            } else {
                display = 0xFF;
                f = 1;
            }
            lastkey = c;
        }

        if (f == 0) {
            if (reset == 0) {
                send2displays(display);
                delay(10);
            } else {
                LATD &= 0xFF9F;
            }
        } else {
            int i = 0;
            do {
                send2displays(display);
                delay(10);
            } while(i++ < 100);
            reset = 1;
        }
    
    }
    return 0;
}
