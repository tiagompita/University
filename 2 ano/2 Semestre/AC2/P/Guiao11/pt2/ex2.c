#include <detpic32.h>
#include <string.h>

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

typedef struct {
    char mem[100];      //Storage area
    int nchar;          // Number of characters to be transmitted
    int posrd;          // Position of the next character to be transmitted
} t_buf;

volatile t_buf txbuf;

void putstrInt(char *s)
{
    while (txbuf.nchar > 0); // Wait while the buffer is not empty
    // Copy all characters of the string "s" to the buffer, and update
    // "nchar"
    int i = 0;
    while (s[i] != '\0' && i < 100) {
        txbuf.mem[i] = s[i];
        i++;
    }
    txbuf.nchar = i;

    // Initialize "posrd" variable with 0
    txbuf.posrd = 0;

    // Enable UART2 Tx interrupts
    IEC1bits.U2TXIE = 1;
}

void _int_(32) isr_uart2(void)
{
    if (IFS1bits.U2TXIF)
    {
        if (txbuf.nchar > 0) {   
            // At least one character to be transmitted
            // U2TXREG = ... // Read 1 character from the buffer and send it
            U2TXREG = txbuf.mem[txbuf.posrd];
            
            // Update buffer "posrd" and "nchar" variables
            txbuf.posrd++;          // Advance read position
            txbuf.nchar--;          // Decrement number of chars left
        } else {
            // Disable UART2 Tx interrupts
            IEC1bits.U2TXIE = 0;
        }
        // Clear UART2 Tx interrupt flag
        IFS1bits.U2TXIF = 0;
    }
}

int main(void)
{
    //  Configure UART2: 115200, N, 8, 1
    configureUART2();
    //  Configure UART2 interrupts, with RX and TX interrupts DISABLED
    //  disable U2RXIE, disable U2TXIE (register IEC1)
    IEC1bits.U2TXIE = 0;
    IEC1bits.U2RXIE = 0;
    //  set UART2 priority level (register IPC8)
    IPC8bits.U2IP = 2;
    //  define TX interrupt mode (UTXISEL bits)
    U2STAbits.UTXISEL = 0;
    //  Enable global Interrupts
    IFS1bits.U2TXIF = 0;
    EnableInterrupts();

    //  Initialize buffer variable "nchar" with 0
    txbuf.nchar = 0;
    while(1)
    {
    putstrInt("Test string which can be as long as you like, up to a maximum of 100 characters\n");
    }
    return 0;
}
