//This code was taken from somewhere without any copyright
//Made minor changes or/and adds

#include "dht11.h"
#include "dwt_stm32_delay.h"

void Set_Pin_Output (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = GPIO_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}

void Set_Pin_Input (GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = GPIO_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOx, &GPIO_InitStruct);
}

void DHT11_Start (void)
{
	Set_Pin_Output (DHT11_PORT, DHT11_PIN);  // set the pin as output
	HAL_GPIO_WritePin (DHT11_PORT, DHT11_PIN, 0);   // pull the pin low
	HAL_Delay(18);   // wait for 18ms
    HAL_GPIO_WritePin (DHT11_PORT, DHT11_PIN, 1);   // pull the pin high
    DWT_Delay_us (20);   // wait for 20us
	Set_Pin_Input(DHT11_PORT, DHT11_PIN);    // set as input
}

uint8_t DHT11_Check_Response (void)
{
	uint8_t Response = 0, timeout= 0;
	DWT_Delay_us (40); // 40
	if (!(HAL_GPIO_ReadPin (DHT11_PORT, DHT11_PIN)))
	{
		DWT_Delay_us (80); // 80
		if ((HAL_GPIO_ReadPin (DHT11_PORT, DHT11_PIN))) Response = 1;
		else Response = -1; // 255
	}
	while ( (timeout < DHT11_TIMEOUT) && (HAL_GPIO_ReadPin (DHT11_PORT, DHT11_PIN)) )   // wait for the pin to go low
	{
		timeout++;
		DWT_Delay_us (10);
	}
	return Response;
}

uint8_t DHT11_Read (void)
{
	uint8_t i,j;
	for (j=0;j<8;j++)
	{
		while (!(HAL_GPIO_ReadPin (DHT11_PORT, DHT11_PIN)));   // wait for the pin to go high
		DWT_Delay_us (40);   // wait for 40 us
		if (!(HAL_GPIO_ReadPin (DHT11_PORT, DHT11_PIN)))   // if the pin is low
		{
			i&= ~(1<<(7-j));   // write 0
		}
		else i|= (1<<(7-j));  // if the pin is high, write 1
		while ((HAL_GPIO_ReadPin (DHT11_PORT, DHT11_PIN)));  // wait for the pin to go low
	}
	return i;
}

// Data consists of decimal and integral parts. A complete data transmission is 40bit, and the
// sensor sends higher data bit first.
// Data format: 8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T
// data + 8bit check sum. If the data transmission is right, the check-sum should be the last 8bit of
// "8bit integral RH data + 8bit decimal RH data + 8bit integral T data + 8bit decimal T data".
//The results are multipled by 10
uint8_t DHT11_Get_RH_TEMP_Values(uint16_t *rhx10, uint16_t *tempx10)
{
	uint8_t Rh_byte1, Rh_byte2, Temp_byte1, Temp_byte2, DHT11_CHECK_SUM, status;
	uint16_t sum;

	DHT11_Start();
	status= DHT11_Check_Response();
	if(status)
	{
		Rh_byte1 = DHT11_Read ();
		Rh_byte2 = DHT11_Read ();
		Temp_byte1 = DHT11_Read ();
		Temp_byte2 = DHT11_Read ();
		DHT11_CHECK_SUM = DHT11_Read ();
		sum= Rh_byte1 + Rh_byte2 + Temp_byte1 + Temp_byte2;
		sum= sum & 0xFF; //check only the lower byte
		if(sum == DHT11_CHECK_SUM) //(uint_8)sum deve ser igual a DHT11_CHECK_SUM
		{
			*tempx10 = Temp_byte1*10 + Temp_byte2;
			*rhx10 = Rh_byte1*10 + Rh_byte2;
			status= 1; //ok
		}
	}
	return (status); //Failed
}
