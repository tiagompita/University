//This code was taken from somewhere without any copyright
//Made minor changes or/and adds
#include "stdio.h"

#include "gpio.h"

#define DHT11_PORT DHT11_DATA_GPIO_Port
#define DHT11_PIN DHT11_DATA_Pin

#define DHT11_TIMEOUT 100 //1 unit is 10uS

void DHT11_Start (void);
uint8_t DHT11_Check_Response (void);
uint8_t DHT11_Read (void);
uint8_t DHT11_Get_RH_TEMP_Values(uint16_t *rh, uint16_t *temp);
