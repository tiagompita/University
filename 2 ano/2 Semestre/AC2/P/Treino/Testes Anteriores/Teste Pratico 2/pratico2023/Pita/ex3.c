#include <detpic32.h>

volatile int counter = 0;

void configureUART2(void) {
    U2MODEbits.BRGH = 0;
    U2BRG = ((PBCLK + 8 * 2400)/(16 * 2400)) - 1;
    U2MODEbits.PDSEL = 1;
    U2MODEbits.STSEL = 1;
    U2STAbits.URXEN = 1;
    U2STAbits.UTXEN = 1;
    U2MODEbits.ON = 1;
}

void putc(char byte) {
    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}

void putstr(char *str) {
    while(*str){
        putc(*str++);
    }
}

void _int_(32) isr_uart2(void) {
    char c;
    c = U2RXREG;
    LATE &=0xFFF0;

    putc(c);

    if (c == 'F') {
        counter = (counter + 1) % 10;
        LATE = (LATE & 0xFFF0) | counter;
    } else if (c == 'C') {
        counter = 0;
        putstr("VALOR MINIMO");
        LATE |= 0x000F;
    }

    IFS1bits.U2RXIF = 0;
}

int main()
{
    configureUART2();
    TRISE &= 0xFFF0;

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 1;
    U2STAbits.URXISEL = 0;

    IFS1bits.U2RXIF = 0;

    EnableInterrupts();

    while (1)
    {
        IdleMode();
    }
    
    return 0;
}
