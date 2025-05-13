#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int main(void)
{
    // Configurar RE0 como saída (LED0)
    TRISE &= 0xFFFE;  
    LATE &= 0xFFFE;   

    // Configurar RD8 como entrada (INT1)
    TRISD |= 0x0100;  

    while (1)
    {
        // RD8 possui logica invertida
        if ((PORTDbits.RD8 == 0) && (LATEbits.LATE0 == 0))
        {
            LATEbits.LATE0 = 1;  

            delay(3000);
            LATEbits.LATE0 = 0;  
        }
    }
    
    return 0;
}
