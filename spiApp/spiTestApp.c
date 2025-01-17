/*! 
@file spiTestApp.c
@brief  contains method for testing of SPI functions and initialization 
@details 

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
*/
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "spiParams.h"
#include "spiComm.h"
#include "timers.h"
#include "dma.h"
#include "I2Commands.h"
#include "gpio.h"

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
 /* initializaing struct vars */
 
 spi_i2_props_t spiI2Props = 
{
 .frameSize = FRAME_SIZE8,
	
 .chnl1En = true,
 .chnl2En = true,
 .continous = true,
 .burst = true,
 .dmaActive = false,
	
 .runMode = CONT_BURST,
 
 .burstSize = BURST_512,
 .convRate = DEF_CONVRATE
};


/*******************************************************************************
 * Code
 ******************************************************************************/
 
																																																													

void InitSetup()
{
  SpiInit();
	PitInit();
	DmaInit();
	GpioInit();
	ActivateSlaveSpi();
}

/*!
@brief  auto test for all 4 modes 
@param  result array of tests , a true in return indicates test is clear
*/
void AutoTestComplete(bool * testResults)
{
	bool (*testFuncs[NO_OF_MODES])(void) = {AutoTestMode1,AutoTestMode2,AutoTestMode3,AutoTestMode4};
	
	for(int a=0; a<NO_OF_MODES; a++)
	{
		testResults[a] = testFuncs[a]();
		if(testResults[a])
			ErrorSet();
		
		SysTickDelayUs(3);
	}
	
	

}




/* EOF */