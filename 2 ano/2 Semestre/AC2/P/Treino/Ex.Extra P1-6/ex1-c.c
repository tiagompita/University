#include <detpic32.h>

int main()
{
    TRISE &= 0xFF0F;
    TRISB |= 0x000F;


    while(1) {
        LATE = ((PORTB & 0x0008) << 1) | ((PORTB & 0x0001) << 7) | ((PORTB & 0x0002) << 5) | ((PORTB & 0x0004) << 3);
    }

    return 0;
}
