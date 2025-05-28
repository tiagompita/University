#include <detpic32.h>
#include <string.h>

void configureUART2(void) {
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    // BRGH: High Baud Rate Enable bit
    // 1 = High - Speed mode – 4x baud clock enabled
    // 0 = Standard Speed mode – 16x baud clock enabled
    U2MODEbits.BRGH = 0;

    U2BRG = ((PBCLK + 8 * 115200) / (16 * 115200)) - 1;

    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    U2MODEbits.PDSEL = 0;
    // PDSEL<1 : 0> : Parity and Data Selection bits
    // 11 = 9 - bit data, no parity
    // 10 = 8 - bit data, odd parity
    // 01 = 8 - bit data, even parity
    // 00 = 8 - bit data, no parity
    U2MODEbits.STSEL = 0;
    // STSEL:
    // Stop Selection bit
    // 1 = 2 Stop bits
    // 0 = 1 Stop bit

    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    U2STAbits.URXEN = 1;
    U2STAbits.UTXEN = 1;

    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;
}

void putc(char byte) {
    // wait while UART2 UTXBF == 1
    while (U2STAbits.UTXBF == 1);

    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
}

void putstr(char *str)
{
    // use putc() function to send each charater ('\0' should not be sent)
    unsigned int i;
    for (i = 0; i < strlen(str); i++)
    {
        putc(str[i]);
        // delay(1000); Observar a impressão char a char
    }
}

void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF)
    {
        // Read character from FIFO (U2RXREG)
        char c = U2RXREG;

        switch (c)
        {
        case '?':
            putstr("AC2-Guiao 11");
            break;
        case 'T':
            LATCbits.LATC14 = 1;
            break;
        case 't':
            LATCbits.LATC14 = 0;
            break;
        default:
            putc(c);
            break;
        }

        // Clear UART2 Rx interrupt flag
        IFS1bits.U2RXIF = 0;
    }
}

int main(void)
{
    //  Configure UART2: 115200, N, 8, 1
    configureUART2();
    
    //  Configure UART2 interrupts, with RX interrupts enabled
    //  and TX interrupts disabled : 
    //  enable U2RXIE, disable U2TXIE(register IEC1)
    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    //  set UART2 priority level(register IPC8)
    IPC8bits.U2IP = 1;
    //  clear Interrupt Flag bit U2RXIF(register IFS1) 
    IFS1bits.U2RXIF = 0;
    //  define RX interrupt mode(URXISEL bits)
    U2STAbits.URXISEL = 0;
    //  Enable global Interrupts
    EnableInterrupts();
    
    TRISCbits.TRISC14 = 0;

    while (1)
    {
        IdleMode();
    }
    return 0;
}
