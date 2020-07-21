
/*! 
@file mainApp.c
@brief  main application file for intellisens I2 SPI testing 
@details 

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
*/
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "fsl_debug_console.h"
#include "spiParams.h"


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
bool testResults[NO_OF_MODES] = {0};

/*******************************************************************************
 * Code
 ******************************************************************************/
/*! @brief  main function to init all the clocks, pins and peripheral modules of the controller, also runs the routine to automatically test functionality 
								of the I2 SPI in all modes*/
int main()
{

	BOARD_InitBootClocks();
  BOARD_InitBootPins();
	
	InitSetup();
	
	AutoTestComplete(testResults);
	
//	AutoTestMode1();
//	AutoTestMode2(); 
//	AutoTestMode3();
//	AutoTestMode4();
	 
	
	while(1)
	{}
	

	

return 0;
}

/* EOF */


