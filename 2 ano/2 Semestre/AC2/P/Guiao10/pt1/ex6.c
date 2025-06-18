#include <detpic32.h>

void configureUART2(void)
{
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

void putc(char byte)
{
    // wait while UART2 UTXBF == 1
    while (U2STAbits.UTXBF == 1);

    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
}

char getc(void)
{

    // Wait while URXDA == 0
    while(U2STAbits.URXDA == 0);

    // Return U2RXREG
    return U2RXREG;
}

int main(void)
{
    // Configure UART2 (115200, N, 8, 1)
    configureUART2();
    while (1)
    {
        putc(getc());
    }
    return 0;
}
