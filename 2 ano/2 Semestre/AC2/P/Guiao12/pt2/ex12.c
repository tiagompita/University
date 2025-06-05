#include <detpic32.h>
#include "pic32_i2c.h"

#define I2C_READ 1
#define I2C_WRITE 0
#define I2C_ACK 0
#define I2C_NACK 1
#define TC74_CLK_FREQ 50000 // Frequency in Hz (see TC74 datasheet)
#define TC74_ADDRESS 0x48   // TC74A0 address (see TC74 datasheet)
#define TC74_RTR 0          // Read temperature command
#define TC74_RWCR 1

volatile int temperatura = 0;
volatile int offset = 0;
volatile int tempMax = 50;
volatile int tempMin = 15;

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

typedef enum { DISPLAY_TEMP, DISPLAY_HI, DISPLAY_LO } DisplayMode;

void send2displays(unsigned char value, DisplayMode mode)
{
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66,
                                         0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    if (mode == DISPLAY_HI) {
        // Exemplo: "HI" -> H = 0x76, I = 0x06
        if (displayFlag == 0) {
            LATD = (LATD & 0xFF9F) | 0x0020;
            LATB = (LATB & 0x80FF) | (0x06 << 8); // 'H'
        } else {
            LATD = (LATD & 0xFF9F) | 0x0040;
            LATB = (LATB & 0x80FF) | (0x76 << 8); // 'I'
        }
    } else if (mode == DISPLAY_LO) {
        // Exemplo: "LO" -> L = 0x38, O = 0x3F
        if (displayFlag == 0) {
            LATD = (LATD & 0xFF9F) | 0x0020;
            LATB = (LATB & 0x80FF) | (0x3F << 8); // 'L'
        } else {
            LATD = (LATD & 0xFF9F) | 0x0040;
            LATB = (LATB & 0x80FF) | (0x38 << 8); // 'O'
        }
    } else {
        int digit_low = value & 0x0F;
        int digit_high = value >> 4;
        if (displayFlag == 0) {
            LATD = (LATD & 0xFF9F) | 0x0020;
            LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
        } else {
            LATD = (LATD & 0xFF9F) | 0x0040;
            LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
        }
    }
    displayFlag = !displayFlag;
}

int tc74_init(void)
{
    i2c1_start();
    int ack = i2c1_send(TC74_ADDRESS << 1 | I2C_WRITE);
    ack |= i2c1_send(TC74_RWCR);
    ack |= i2c1_send(0);
    i2c1_stop();
    return ack;
}

int readTemperature(int *temp)
{
    i2c1_start();
    int ack = i2c1_send(TC74_ADDRESS << 1 | I2C_WRITE);
    ack |= i2c1_send(TC74_RTR);
    i2c1_restart();
    ack |= i2c1_send(TC74_ADDRESS << 1 | I2C_READ);
    char tempChar;
    i2c1_receive(&tempChar, I2C_NACK);
    *temp = (int)tempChar; // Conversão explícita para int
    i2c1_stop();

    return ack;
}

void _int_(4) isr_t1(void)
{
    int ack = readTemperature(&temperatura);
    if (ack == 1)
    {
        printStr("Erro: NACK do TC74!\n");
    }
    IFS0bits.T1IF = 0;
}

void _int_(8) isr_t2(void) {

    int temp_disp = temperatura + offset;
    if (temp_disp >= tempMax)
        send2displays(0, DISPLAY_HI);
    else if (temp_disp <= tempMin)
        send2displays(0, DISPLAY_LO);
    else
        send2displays(toBcd(temp_disp), DISPLAY_TEMP);
    

    IFS0bits.T2IF = 0;
}

int main(void)
{
    i2c1_init(TC74_CLK_FREQ);
    tc74_init();


    // RB8-RB14 (segments) & RD5-RD6 (displays) as outputs
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    // Timer 1
    T1CONbits.TCKPS = 2 ; // K scaler
    PR1 = 62499;
    TMR1 = 0;
    T1CONbits.TON = 1;

    IPC1bits.T1IP = 2; // Interrupt
    IEC0bits.T1IE = 1;
    IFS0bits.T1IF = 0;

    // Timer 2
    T2CONbits.TCKPS = 3 ; // K scaler
    PR2 = 41666;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2; // Interrupt
    IEC0bits.T2IE = 1;
    IFS0bits.T2IF = 0;

    EnableInterrupts();

    TRISCbits.TRISC14 = 0;

    while (1)
    {
        char key = inkey();
        if (key == '+')
            offset++;
        if (key == '-')
            offset--;

        if ((temperatura + offset) >= tempMax || (temperatura + offset) <= tempMin)
        {
            LATCbits.LATC14 = 1;
        }
        else
        {
            LATCbits.LATC14 = 0;
        }

        // printInt10(temperatura + offset);
        // putChar('\n');
    }

    return 0;
}
