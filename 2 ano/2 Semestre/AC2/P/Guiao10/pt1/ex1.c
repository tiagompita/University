#include <detpic32.h>

int main(void)
{
    // Configure UART2:
    // 115200 bps (baudrate)   /   sem paridade    /   8 data bits     /   1 stop bit
    // (115200, N, 8, 1)

    // 1 - Configure BaudRate Generator
    U2BRG = ((PBCLK + 8 * 115200) / 16 * 115200) -1;
    U2MODEbits.BRGH = 0;

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