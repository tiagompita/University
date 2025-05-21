#include <detpic32.h>

void configureUART1(void)
{
    // Configure UART1:
    // 1 - Configure BaudRate Generator

    // BRGH: High Baud Rate Enable bit
    // 1 = High - Speed mode – 4x baud clock enabled
    // 0 = Standard Speed mode – 16x baud clock enabled
    U1MODEbits.BRGH = 0;

    U1BRG = ((PBCLK + 8 * 115200) / (16 * 115200)) - 1;

    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U1MODE register)
    U1MODEbits.PDSEL = 1;
    // PDSEL<1 : 0> : Parity and Data Selection bits
    // 11 = 9 - bit data, no parity
    // 10 = 8 - bit data, odd parity
    // 01 = 8 - bit data, even parity
    // 00 = 8 - bit data, no parity
    U1MODEbits.STSEL = 0;
    // STSEL:
    // Stop Selection bit
    // 1 = 2 Stop bits
    // 0 = 1 Stop bit

    // 3 – Enable the trasmitter and receiver modules (see register U1STA)
    U1STAbits.URXEN = 1;
    U1STAbits.UTXEN = 1;

    // 4 – Enable UART1 (see register U1MODE)
    U1MODEbits.ON = 1;
}


void putc1(char byte)
{
    // wait while UART1 UTXBF == 1
    while (U1STAbits.UTXBF == 1);

    // Copy "byte" to the U1TXREG register
    U1TXREG = byte;
}

int main(void)
{
    // Configure UART1 (115200, E, 8, 1)
    configureUART1();
    while (1)
    {
        putc1(0x5A);
        delay(10);
    }
    return 0;
}
