// ***************************************************************************
// pic32_i2c.h
//
// Basic functions for configuring and operating the I2C module 1 on the
// PIC32 microcontroller, for communication with peripheral devices.
//
// DETI-UA, J.L.Azevedo, Abr/2025
// ****************************************************************************

#ifndef __PIC32_I2C_H__
#define __PIC32_I2C_H__

#define I2C_TIMEOUT_ERROR   1  // Timeout error code
#define I2C_SUCCESS         0  // Success code

/**
 * @brief Initializes the I2C1 module with the specified clock frequency.
 * 
 * @param i2c_clock The desired clock frequency for I2C communication.
 */
void i2c1_init(int clock_freq);

/**
 * @brief Generates a start condition on the I2C bus to initiate communication.
 */
void i2c1_start(void);

/**
 * @brief Generates a repeated start condition on the I2C bus to continue communication.
 */
void i2c1_restart(void);

/**
 * @brief Generates a stop condition on the I2C bus to end communication.
 */
void i2c1_stop(void);

/**
 * @brief Sends a byte of data on the I2C bus and checks for acknowledgment.
 * 
 * @param value The byte of data to send.
 * 
 * @return char
 *    - 0: Acknowledge received (ACK) 
 *    - 1: Not acknowledge received (NACK) 
 */
char i2c1_send(char value);

/**
 * @brief Receives a byte of data from the I2C bus and sends a acknowledge (ACK or NACK).
 * 
 * @param value Pointer to a variable where the received byte will be stored.
 * @param ackBit Specifies the acknowledge value to send after receiving the byte:
 *    - 0: Send ACK
 *    - 1: Send NACK
 * 
 * @return char
 *    - 0: Operation successful.
 *    - 1: No data received (timeout occurred).
 */
char i2c1_receive(char *value, char ack);

#endif
