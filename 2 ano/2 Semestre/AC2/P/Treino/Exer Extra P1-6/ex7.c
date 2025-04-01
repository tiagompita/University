#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int main()
{
    TRISB |= 0x000F;

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 2-1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    while(1) {
        AD1CON1bits.ASAM = 1;
        while( IFS1bits.AD1IF == 0 );

        char bits = (PORTB & 0x000F);

        int freq = 1 + (ADC1BUF0 * 4) / 1023;   // Mapeia [0, 1023] para [1, 5] Hz
        int delayMs = 1000 / freq;              // Calcula o delay em ms para a frequência

        putChar('\r');
        printStr("DS=");
        putChar((bits & 0x08) ? '1' : '0'); // RB3
        putChar((bits & 0x04) ? '1' : '0'); // RB2
        putChar((bits & 0x02) ? '1' : '0'); // RB1
        putChar((bits & 0x01) ? '1' : '0'); // RB0

        printStr(" ADC=");
        printInt(ADC1BUF0, 10); // Exibe o valor ADC
        printStr(" Freq=");
        printInt(freq, 10); // Exibe a frequência calculada
        putChar(' ');

        delay(delayMs);

        IFS1bits.AD1IF = 0;
    }
    return 0;
}
