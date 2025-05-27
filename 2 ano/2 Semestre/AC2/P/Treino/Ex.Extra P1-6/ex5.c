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
    // configure RB8-RB14 as outputs
    // configure RD5-RD6 as outputs
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    int contador = 0;
    int print_value = 0;
    int freq = 10;
    int displayCounter = 0;
    while(1){
        
        char c = inkey();
        if ('0' <= c && c <= '4') {
            freq = 2 * (1 + (c - '0'));
        }
        if (c == '\n') {
            printStr(" // Freq: ");
            printInt10(freq);
            printStr(" Hz ");
            
            print_value = contador;
        }

        contador = (contador + 1) % 100;

        putChar('\r');
        printStr("Contador: ");
        printInt10(contador);

        if (displayCounter++ >= (freq / 50)) {
            send2displays(print_value);
            displayCounter = 0; // Resetar o contador do display
        }
        
        delay(freq); 
    }
    return 0;
}
