#include <detpic32.h>
volatile unsigned char voltage = 0; // Global variable

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

unsigned char toBcd(unsigned char value) 
{ 
    return ((value / 10) << 4) + (value % 10); 
}

void send2displays(unsigned char value) 
{ 
    static const char disp7Scodes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    // static variable: doesn't loose its
    // value between calls to function
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

#define N 8
void ADconfig() {
    // Configure the A/D module and port RB4 as analog input 

    TRISBbits.TRISB4 = 1;       // RB4 digital output disconnected 
    AD1PCFGbits.PCFG4= 0;       // RB4 configured as analog input 
    AD1CON1bits.SSRC = 7;       // Conversion trigger selection bits: in this 
                                //  mode an internal counter ends sampling and 
                                //  starts conversion 
    AD1CON1bits.CLRASAM = 1;    // Stop conversions when the 1st A/D converter 
                                //  interrupt is generated. At the same time, 
                                //  hardware clears the ASAM bit 
    AD1CON3bits.SAMC = 16;      // Sample time is 16 TAD (TAD = 100 ns) 
    AD1CON2bits.SMPI = N-1;     // Interrupt is generated after N samples 
                                //  (replace N by the desired number of 
                                //  consecutive samples) 
    AD1CHSbits.CH0SA = 4;       // replace x by the desired input  
                                //  analog channel (0 to 15) 
    AD1CON1bits.ON = 1;         // Enable A/D converter 
                                //  This must the last command of the A/D 
                                //  configuration sequence
}

// Interrupt Handler
void _int_(27) isr_adc(void)  // Replace VECTOR by A/D vector number - see "PIC32 family data sheet" (pages 74-76)
{
    // Read 8 samples (ADC1BUF0, ..., ADC1BUF7) and calculate average
    int *p = (int *)(&ADC1BUF0);
    int average = 0;
    for(; p <= (int *)(&ADC1BUF7); p+=4 ) { 
        average += *p;
    }
    average /= N;

    //Calculate voltade amplitude
    // Convert voltage amplitude to decimal and store the result in the 
    // global variable "voltage"
    voltage = (average * 33 + 511) / 1023;

    printStr("VAL_AD: ");
    printInt(average, 10 | 4 << 16);
    printStr(" | V: ");
    printInt(voltage, 10 | 4 << 16);
    putChar('\r');

    IFS1bits.AD1IF = 0;     // Reset AD1IF flag
}

int main(void) { 

    unsigned int cnt = 0;
    
    // Configure all (digital I/O, analog input, A/D module, interrupts)

    // configure RB8-RB14 as outputs
    TRISB = (TRISB & 0x80FF);
    // configure RD5-RD6 as outputs
    TRISD &= 0xFF9F;

    ADconfig();

    // Configure interrupt system
    IPC6bits.AD1IP = 2;  // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0;  // clear A/D interrupt flag
    IEC1bits.AD1IE = 1;  // enable A/D interrupts
    EnableInterrupts();

    while(1) 
    { 
        if (cnt == 0) {
            // Start conversion 
            AD1CON1bits.ASAM = 1;

            // all activity is processed by the ISR
        }
        cnt = (cnt + 1) % 20;

        // Send voltage value to displays
        send2displays(voltage);

        // Wait 10 ms (using the core timer)
        delay(10);

    } 
    return 0; 
}
