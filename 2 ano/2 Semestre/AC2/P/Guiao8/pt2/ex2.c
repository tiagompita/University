#include <detpic32.h>

int main(void)
{
    // Configure ports, Timer T2, interrupts and external interrupt INT1
    
    // Configurar RE0 como saída (LED0)
    TRISE &= 0xFFFE;
    LATE &= 0xFFFE;

    // Configurar RD8 como entrada (INT1)
    TRISD |= 0x0100;

    T2CONbits.TCKPS = 7; // 1:256 prescaler (fout_presc = 0.333333333Hz)
    PR2 = 234608;         // PR1 value for 0.333 Hz (assuming 20 MHz PBCLK)
    TMR2 = 0;            // Reset Timer T2 count register
    T2CONbits.TON = 1;   // Enable Timer T2
    
    IPC2bits.T2IP = 2;
    IEC0bits.T2IE = 1;
    IFS0bits.T2IF = 0;
    
    IPC1bits.INT1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.INT1IE = 1; // Enable timer INT1 interrupts
    IFS0bits.INT1IF = 0; // Reset timer INT1 interrupt flag
    

    EnableInterrupts();
    while (1)
    {
        IdleMode();
    }
    return 0;
}

void _int_(8) isr_T2()
{
    static int count = 0;
    count++;
    if (count == 5)
    {
        T2CONbits.TON = 0;
        LATE &= 0xFFFE;
        count = 0;
    }
    
    IFS0bits.T2IF = 0;
}

void _int_(7) isr_INT1()
{
    LATE |= 0x0001;
    TMR2 = 0;
    T2CONbits.TON = 1;
    
    IFS0bits.INT1IF = 0;
}
