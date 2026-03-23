#ifndef DWT_STM32_DELAY_H
#define DWT_STM32_DELAY_H

#ifdef __cplusplus
extern "C" {
#endif


#include "stm32f4xx_hal.h"

extern uint8_t DelayROM[256];


/**
 * @brief  Initializes DWT_Cycle_Count for DWT_Delay_us function
 * @return Error DWT counter
 *         1: DWT counter Error
 *         0: DWT counter works
 */
uint32_t DWT_Delay_Init(void);



/**
 * @brief  This function provides a delay (in microseconds)
 * @param  microseconds: delay in microseconds
 */
static inline void DWT_Delay_us(volatile uint32_t microseconds)
{
  uint32_t clk_cycle_start = DWT->CYCCNT;

  /* Go to number of cycles for system */
  microseconds *= (HAL_RCC_GetHCLKFreq() / 1000000);

  /* Delay till end */
  while ((DWT->CYCCNT - clk_cycle_start) < microseconds);
}

/**
 * @brief  This function provides a delay
 * @param  of aprox. 280nS
 */
static inline void DWT_Delay_280n()
{
  uint32_t clk_cycle_start = DWT->CYCCNT;
  uint32_t nseconds= 1;

  /* Go to number of cycles for system */
  nseconds *= (HAL_RCC_GetHCLKFreq() / 100000000);

  /* Delay till end */
  while ((DWT->CYCCNT - clk_cycle_start) < nseconds);
}

/**
 * @brief  This function provides a delay
 * @param  of aprox. 400nS
 */
static inline void DWT_Delay_400n()
{
  uint32_t clk_cycle_start = DWT->CYCCNT;
  uint32_t nseconds= 60;

  /* Go to number of cycles for system */
  nseconds *= (HAL_RCC_GetHCLKFreq() / 100000000);

  /* Delay till end */
  while ((DWT->CYCCNT - clk_cycle_start) < nseconds);
}

#ifdef __cplusplus
}
#endif

#endif
