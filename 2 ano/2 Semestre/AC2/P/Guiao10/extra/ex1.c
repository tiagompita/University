void configureUART2(unsigned int baud, char parity, unsigned int stopbits)
{
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    // BRGH: High Baud Rate Enable bit
    // 1 = High - Speed mode – 4x baud clock enabled
    // 0 = Standard Speed mode – 16x baud clock enabled
    U2MODEbits.BRGH = 0;

    if (baud <= 115200) {
        U2BRG = ((PBCLK + 8 * baud) / (16 * baud)) - 1;
    } else {
        U2BRG = ((PBCLK + 2 * baud) / (4 * baud)) - 1;
    }

    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    // PDSEL<1 : 0> : Parity and Data Selection bits
    // 11 = 9 - bit data, no parity
    // 10 = 8 - bit data, odd parity
    // 01 = 8 - bit data, even parity
    // 00 = 8 - bit data, no parity
    switch (parity)
    {
    case 'N':
        U2MODEbits.PDSEL = 0;
        break;
    case 'E':
        U2MODEbits.PDSEL = 1;
        break;
    case 'O':
        U2MODEbits.PDSEL = 2;
        break;
    }

    // STSEL:
    // Stop Selection bit
    // 1 = 2 Stop bits
    // 0 = 1 Stop bit
    switch (stopbits)
    {
    case 1:
        U2MODEbits.STSEL = 0;
        break;
    case 2:
        U2MODEbits.STSEL = 1;
        break;
    }

    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    U2STAbits.URXEN = 1;
    U2STAbits.UTXEN = 1;

    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;
}