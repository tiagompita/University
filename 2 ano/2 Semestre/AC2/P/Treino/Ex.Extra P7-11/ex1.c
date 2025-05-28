#include <detpic32.h>

volatile char disp = 0x00;

void send2displays(unsigned char value)
{
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    int digit_low = value & 0x0F;
    int digit_high = value >> 4;

    if (value == 0x79) {
        LATB &= 0x80FF;
        LATD &= 0xFF9F;
    } else {
        if (displayFlag == 0)
        {
            LATD = (LATD & 0xFF9F) | 0x0020;
            LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
        }
        else
        {
            LATD = (LATD & 0xFF9F) | 0x0040;
            LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
        }
    }
    displayFlag = !displayFlag;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms)
        ;
}

void _int_(8) isr_t2(void) {
    send2displays(disp);
    IFS0bits.T2IF = 0;
}

int main()
{
    //Display
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;
    TRISE &= 0xFFF0;

    LATE &= 0xFFF0;

    T2CONbits.TCKPS = 2; // K scaler
    PR2 = 49999;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2;              // Interrupt
    IEC0bits.T2IE = 1;
    IFS0bits.T2IF = 0;

    EnableInterrupts();

    int done = 0;

    while (1)
    {
        char c = inkey();

        if (c != 0) {
            if (c == 48) {
                LATE = (0xFFF0 & LATE) | 0x0001;
                disp = 0x00;
            } else if (c == 49) {
                LATE = (0xFFF0 & LATE) | 0x0002;
                disp = 0x01;
            } else if (c == 50) {
                LATE = (0xFFF0 & LATE) | 0x0004;
                disp = 0x02;
            } else if (c == 51) {
                LATE = (0xFFF0 & LATE) | 0x0008;
                disp = 0x03;
            } else {
                if (done == 0) { //Qualquer tecla premida dentro desse intervalo de tempo deve ser ignorada. NAO ESTA BEM
                    done = 1;
                    LATE = (0xFFF0 & LATE) | 0x000F;
                    disp = 0xFF;
                    delay(1000);
                    LATE &= 0xFFF0;
                    disp = 0x79;
                    done = 0;
                }
            }
        }
    }
    
    return 0;
}

