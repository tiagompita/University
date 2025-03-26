#include <detpic32.h>

#define N 1
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
void _int_(27) isr_adc(void)  // Replace VECTOR by A/D vector
                            // number - see "PIC32 family data 
                            // sheet" (pages 74-76)
{
    // Read conversion result ( ADC1BUF0 ) and print it
    printInt(ADC1BUF0, 16 | 3 << 16);
    putChar('\n');
    
    // Start A/D conversion
    AD1CON1bits.ASAM = 1;
    IFS1bits.AD1IF = 0;     // Reset AD1IF flag
}
int main(void) { 

    // Configure all (digital I/O, analog input, A/D module)
    ADconfig();

    // Configure interrupt system
    IPC6bits.AD1IP = 2;  // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0;  // clear A/D interrupt flag
    IEC1bits.AD1IE = 1;  // enable A/D interrupts
    EnableInterrupts();

    while(1) 
    { 

        // all activity is processed by the ISR

    } 
    return 0; 
}
