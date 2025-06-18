#include <detpic32.h>
#include <string.h>

void configureUART2(void) {
    U2MODEbits.BRGH = 0;
    U2BRG = ((PBCLK + 8 * 9600)/(16 * 9600)) -1;

    U2MODEbits.PDSEL = 2;
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
    if (IFS1bits.U2RXIF) {
        
        char c;
        int value;
        c = U2RXREG;

        putc(c);
        
        if (c == 'D') {
            value = PORTB & 0x000F;
            int dezenas = value / 10;
            int unidades = value % 10;
            putstr("\nDSD=");
            putc(dezenas + '0');
            putc(unidades + '0');
        }

        LATEbits.LATE7 = !LATEbits.LATE7;

        IFS1bits.U2RXIF = 0;
    }
}

int main()
{
    configureUART2();

    // 1111 1111 0111 1111
    TRISE &=0xFF7F;

    LATE &=0xFEFF;
    TRISB |=0x000F;

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
