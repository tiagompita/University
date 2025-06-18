// ***************************************************************************
// pic32_i2c.c
//
// Basic functions for configuring and operating the I2C module 1 on the
// PIC32 microcontroller, for communication with peripheral devices.
//
// DETI-UA, J.L.Azevedo, Abr/2025
// ****************************************************************************

#include <detpic32.h>
#include "pic32_i2c.h"

#define I2C_TIMEOUT 10000	// Timeout for read operations (~2ms @ 40Hz)
#define I2C_CON_MASK 0x1F	// 5 LSBits mask to verify control register


// ****************************************************************************
void i2c1_init(int clock_freq)
{
	if (clock_freq <= 0) 
		return;			// Protection against invalid clock frequency value

	I2C1CONbits.ON = 0;	// Disable the module before configuring
	I2C1STAT = 0;		// Clear any potential error flags

	I2C1BRG = (PBCLK / (2 * clock_freq)) - 2;

	I2C1CONbits.ON = 1;	// Enable the module
}

// ****************************************************************************
void i2c1_start(void)
{
	while (I2C1CON & I2C_CON_MASK);	// Wait until the lower 5 control bits of I2C1CON are cleared,
									// indicating the I2C module is idle
	
	I2C1CONbits.SEN = 1;			// Initiate the START condition
	
	while (I2C1CONbits.SEN == 1);	// Wait until the START condition is completed (SEN bit is cleared) 
}

// ****************************************************************************
void i2c1_restart(void)
{
	while (I2C1CON & I2C_CON_MASK);	// Wait until the lower 5 control bits of I2C1CON are cleared,
									// indicating the I2C module is idle
	
	I2C1CONbits.RSEN = 1;			// Initiate the RESTART condition
	
	while (I2C1CONbits.RSEN == 1);	// Wait until the RESTART condition is completed (RSEN bit is cleared) 
}

// ****************************************************************************
void i2c1_stop(void)
{
	while (I2C1CON & I2C_CON_MASK);	// Wait until the lower 5 control bits of I2C1CON are cleared,
									// indicating the I2C module is idle

	I2C1CONbits.PEN = 1;			// Initiate the STOP condition

	while (I2C1CONbits.PEN == 1);	// Wait until the STOP condition is completed (PEN bit is cleared) 
}

// ****************************************************************************
char i2c1_send(char value)
{
	I2C1TRN = value;				// Load the data to be transmitted into the transmit register
	while (I2C1STATbits.TRSTAT == 1);// Wait while transmission is in progress (8 bits + ACK)

	return I2C1STATbits.ACKSTAT;	// Return ACKSTAT bit: 0 -> ACK received, 1 -> NACK received
}

// ****************************************************************************
char i2c1_receive(char *value, char ackBit)
{
	int timeOut = I2C_TIMEOUT;
	int retVal;

	while (I2C1CON & I2C_CON_MASK);	// Wait until the lower 5 bits of I2C1CON
									// are cleared, indicating the I2C module is idle

	I2C1CONbits.RCEN = 1;			// Enable Master reception

	// Wait until data is received or timeout occurs
	while ((I2C1STATbits.RBF == 0) && (timeOut-- > 0));	

	if(timeOut > 0)
	{
		while (I2C1CON & I2C_CON_MASK);	// Wait until the lower 5 bits of I2C1CON are cleared

		I2C1CONbits.ACKDT = ackBit & 1;	// ACK => ackBit=0 / NACK => ackBit=1
		I2C1CONbits.ACKEN = 1;			// Start Acknowledge sequence w/ ACK or NACK

		*value = I2C1RCV;			// Read the received value
		I2C1CONbits.ACKEN = 0;		// Clear the ACKEN bit after the operation
		retVal = I2C_SUCCESS;		// Success in receiving
	}
	else
	{
		*value = 0;
		retVal = I2C_TIMEOUT_ERROR;	// Timeout during reception
	}

	return retVal;					// Return success or timeout error
}

