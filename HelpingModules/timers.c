/*! 
@file 
@brief 
@details 

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
*/
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "spiParams.h"
#include "timers.h"

/*******************************************************************************
 * Defines
 ******************************************************************************/

/*******************************************************************************
 * Enums
 ******************************************************************************/

/*******************************************************************************
 * Structs
 ******************************************************************************/

 /*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/
 void PitInit()
{
	uint32_t cntDwnVal = DEF_CNTDWN_VAL;
	pit_config_t pitConfig; 
	PIT_GetDefaultConfig(&pitConfig);
	PIT_Init(PIT, &pitConfig);
	PIT_SetTimerPeriod(PIT, kPIT_Chnl_0, USEC_TO_COUNT(cntDwnVal, PIT_SOURCE_CLOCK));
}


/*!
@brief  creates delay usign sys tick timer 
@param  delay in microseconds
 */
 void SysTickDelayUs(float delay)
{
	SysTick->LOAD = SystemCoreClock*delay/1000000;
	SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;

	while ((SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk) ==0)
		__nop();
	
	SysTick->CTRL &= ~(SysTick_CTRL_ENABLE_Msk);
}


/* EOF */