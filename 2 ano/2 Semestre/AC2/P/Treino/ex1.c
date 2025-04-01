#include <detpic32.h>

int main()
{
    TRISE &= 0xFFF0;
    TRISB |= 0x000F;


    while(1) {
        LATE = (PORTB & 0x0008 >> 3) | (PORTB & 0x0001 << 3) | (PORTB & 0x0002 << 1) | (PORTB & 0x0004 >> 1);
    }

    return 0;
}
