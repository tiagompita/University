#include <detpic32.h>

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms)
        ;
}

void configureUART2(void)
{
    // Configure UART2:
    // 115200 bps (baudrate)   /   sem paridade    /   8 data bits     /   1 stop bit
    // (115200, N, 8, 1)

    // 1 - Configure BaudRate Generator
    U2BRG = ((PBCLK + 2 * 115200) / (4 * 115200)) - 1;

    // BRGH: High Baud Rate Enable bit
    // 1 = High - Speed mode – 4x baud clock enabled
    // 0 = Standard Speed mode – 16x baud clock enabled
    U2MODEbits.BRGH = 1;

    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 0;

    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    U2STAbits.URXEN = 1;
    U2STAbits.UTXEN = 1;

    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;
}

void putc(char byte)
{
    // wait while UART2 UTXBF == 1
    while (U2STAbits.UTXBF == 1)
        ;

    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
}

int main(void)
{
    // Configure UART2 (115200, N, 8, 1)
    configureUART2();

    while (1)
    {
        putc('+');
        // wait 1 s
        delay(1000);
    }
    return 0;
}
