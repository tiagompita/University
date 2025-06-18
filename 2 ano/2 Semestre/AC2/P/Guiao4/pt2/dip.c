#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms); 
}

int main()
{

    // configure RB0 to RB3 as inputs
    TRISB |= 0x000F;
    // Read bit3-0 from dipswitch
    PORTB &= 0x000F;

    while (1)
    {
        // Read bit3-0 from dipswitch
        PORTB &= 0x000F;
        printStr("DIP: ");
        printInt(PORTB, 16);
        putChar('\r');
        delay(1000);
    }

    return 0;
}
