#include <detpic32.h>
#include "pic32_i2c.h"

#define I2C_READ        1   
#define I2C_WRITE       0
#define I2C_ACK         0
#define I2C_NACK        1
#define TC74_CLK_FREQ   50000       // Frequency in Hz (see TC74 datasheet)
#define TC74_ADDRESS    0x48        // TC74A0 address (see TC74 datasheet)
#define TC74_RTR        0           // Read temperature command

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int readTemperature(char *temp) {
    i2c1_init(TC74_CLK_FREQ);

    i2c1_start();
    int ack1 = i2c1_send(TC74_ADDRESS << 1 | I2C_WRITE);
    if (ack1 == 1) {
        printStr("Erro: NACK do TC74!\n");
        i2c1_stop();
        return 1;
    }
    int ack2 = i2c1_send(TC74_RTR);
    if (ack2 == 1) {
        printStr("Erro: NACK do TC74!\n");
        i2c1_stop();
        return 1;
    }
    i2c1_restart();
    int ack3 = i2c1_send(TC74_ADDRESS << 1 | I2C_READ);
    if (ack3 == 1) {
        printStr("Erro: NACK do TC74!\n");
        i2c1_stop();
        return 1;
    }
    i2c1_receive(temp, I2C_NACK);
    i2c1_stop();
    return 0;
}

int main(void)
{
    char temperatura = 0;
    int offset = 0;

    while (1)
    {
        readTemperature(&temperatura);
        delay(250);

        char key = inkey();
        if (key == '+') offset++;
        if (key == '-') offset--;

        printInt10(temperatura + offset);
        putChar('\n');
    }

    return 0;
}
