#include <detpic32.h>
#include <string.h>

#define N 8

int voltMin;
int voltMax;

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms)
        ;
}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value)
{
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = toBcd(value) & 0x0F;
    int digit_high = toBcd(value) >> 4;

    if (displayFlag == 0)
    {
        // select display low
        LATD = (LATD & 0xFF9F) | 0x0020;
        // send digit_low (dl) to display:
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    }
    else
    {
        // select display high
        LATD = (LATD & 0xFF9F) | 0x0040;
        // send digit_high (dh) to display:
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
    }

    displayFlag = !displayFlag;
}

volatile int voltage = 0; // Global variable

void _int_(4) isr_T1(void)
{
    // Start A/D conversion
    AD1CON1bits.ASAM = 1;
    // Reset T1IF flag
    IFS0bits.T1IF = 0;
}

void _int_(12) isr_T3(void)
{
    // Send the value of the global variable "voltage" to the displays
    // using BCD (decimal) format
    send2displays(voltage);

    // Reset T3IF flag
    IFS0bits.T3IF = 0;
}

void _int_(27) isr_adc(void)
{
    // Calculate buffer average (8 samples)
    int *p = (int *)(&ADC1BUF0);
    int average = 0;
    for (; p <= (int *)(&ADC1BUF7); p += 4)
    {
        average += *p;

        if (voltMin > *p) {
            voltMin = *p;
        }
        if (voltMax < *p) {
            voltMax = *p;
        }
    }
    average /= N;
    // Calculate voltage amplitude and copy it to "voltage"
    voltage = (average * 33 + 511) / 1023;

    printStr("VAL_AD: ");
    printInt(average, 10 | 4 << 16);
    printStr(" | V: ");
    printInt(voltage, 10 | 4 << 16);
    putChar('\r');

    IFS1bits.AD1IF = 0; // Reset AD1IF flag
}

void configureAll(void)
{
    // Configure Timers T1 and T3 with interrupts enabled)

    T1CONbits.TCKPS = 2; // 1:64 prescaler (fout_presc = 312500Hz)
    PR1 = 62499;         // PR1 value for 5Hz (assuming 20 MHz PBCLK)
    TMR1 = 0;            // Reset Timer T1 count register
    T1CONbits.TON = 1;   // Enable Timer T1

    IPC1bits.T1IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1; // Enable timer T1 interrupts
    IFS0bits.T1IF = 0; // Reset timer T1 interrupt flag

    T3CONbits.TCKPS = 2; // 1:4 (fout_presc = 5MHz)
    PR3 = 49999;         // PR3 value for 5MHz
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    // Configure the A/D module and port RB4 as analog input

    TRISBbits.TRISB4 = 1;     // RB4 digital output disconnected
    AD1PCFGbits.PCFG4 = 0;    // RB4 configured as analog input
    AD1CON1bits.SSRC = 7;     // Conversion trigger selection bits: in this
                              //  mode an internal counter ends sampling and
                              //  starts conversion
    AD1CON1bits.CLRASAM = 1;  // Stop conversions when the 1st A/D converter
                              //  interrupt is generated. At the same time,
                              //  hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;    // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = N - 1; // Interrupt is generated after N samples
                              //  (replace N by the desired number of
                              //  consecutive samples)
    AD1CHSbits.CH0SA = 4;     // replace x by the desired input
                              //  analog channel (0 to 15)
    AD1CON1bits.ON = 1;       // Enable A/D converter
                              //  This must the last command of the A/D
                              //  configuration sequence

    // ADC Interrupt
    IPC6bits.AD1IP = 2;
    IEC1bits.AD1IE = 1;
    IFS1bits.AD1IF = 0;

    // configure RB8-RB14 as outputs and RB0 as input
    TRISB = (TRISB & 0x80FF) | 0x0001;
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;
}

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
    while (U2STAbits.UTXBF == 1)
        ;

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

void _int_(32) isr_uart2(void)
{
    if (IFS1bits.U2RXIF)
    {
        // Read character from FIFO (U2RXREG)
        char c = U2RXREG;

        if (c == 'M')
        {
            char v = toBcd(voltMax);
            putstr("VMax=");
            putc((v >> 4) + 0x30);
            putc('.');
            putc((v & 0x0F) + 0x30);
            putc('V');
            putc('\n');
        }
        else if (c == 'm')
        {
            char v = toBcd(voltMin);
            putstr("VMin=");
            putc((v >> 4) + 0x30);
            putc('.');
            putc((v & 0x0F) + 0x30);
            putc('V');
            putc('\n');
        }

        // Clear UART2 Rx interrupt flag
        IFS1bits.U2RXIF = 0;
    }
}

int main(void)
{

    configureAll(); // Function to configure all (digital I/O, analog
                    // input, A/D module, timers T1 and T3, interrupts)

    configureUART2();

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 1;
    IFS1bits.U2RXIF = 0;

    EnableInterrupts(); // Global Interrupt Enable

    voltMin = 1023;
    voltMax = 0;
    while (1)
    {
        IdleMode();
    }
    return 0;
}
