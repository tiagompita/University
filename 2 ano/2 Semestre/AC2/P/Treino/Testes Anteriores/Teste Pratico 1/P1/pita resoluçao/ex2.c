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

    TRISE &= 0xFF80;

    int counter = 0;
    char display = 0x00;
    int i = 0;
    while(1) {
        
        char c = inkey();

        if ((PORTB & 0x0003) == 0) {
            display = 0xFF;
            LATE = 0;
        } else if((PORTB & 0x0003) == 1) {
            if ('0' <= c && c <= '9') {
                display = ((c - '0') << 4);
            }
            LATE = 0;
        } else if((PORTB & 0x0003) == 2) {
            if ('0' <= c && c <= '9') {
                display = c - '0';
            }
            LATE = 0;
        } else if((PORTB & 0x0003) == 3) {
            
            if (i++ >= (100 / 5)) {
                counter = (counter + 1) % 60;
                display = counter;
                LATE = counter;
                i = 0;
            }
            
        }

        send2displays(display);
        delay(10); //100hz
    }
    return 0;
}
