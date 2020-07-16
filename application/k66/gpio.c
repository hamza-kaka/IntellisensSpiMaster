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
#include "UserConfig.h"
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

void GpioInit()
{
	ERROR_GPIO->PDDR |= (1<<ERROR_PIN); 
	ERROR_GPIO->PCOR |= (1<<ERROR_PIN); 
}

void ErrorSet()
{
	ERROR_GPIO->PDOR |= (1<<ERROR_PIN); 
}

/* EOF */