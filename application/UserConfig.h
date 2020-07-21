/*! 
@file UserConfig.h
@brief  file for user configurable settings in the SPI testing of I2
@details configurable parameters for testing and option for changing modules of the master MCU

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
 */
#ifndef  USERCONFIG_I2_SPI_h
#define USERCONFIG_I2_SPI_h
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "fsl_common.h"

/*******************************************************************************
 * Defines
 ******************************************************************************/
#define BURST_CHNL_IND_CHCK (0)  //check if channels are working independently in burst mode 
#define CURRENT_COMP_TEST (0)  //current comparison test, compare if the current values read are equal to the actual current running through the I2

#if CURRENT_COMP_TEST //feed values for actual current for both the channels 
	#define CH1_CUR_VAL (2.0f) // amps
	#define CH2_CUR_VAL (2.0f) // amps
#endif

#define DEF_BAUDRATE (24000000) //default baudrate
#define DEF_CONVRATE (500000)  //default conversion rate


#define SPI_MODULE_NO (SPI2) 
#define CONT_CLCK_ENABLE (0) //continous clock enable for SPI
#define DEF_PCS_NO (0) //slave select number from SPI module

#define DMA_MUX_SPI_RX 38 // DMA mux SPI recieve channel , different for each MCU 
#define DMA_MUX_SPI_TX 39 // DMA mux SPI transmit channel , different for each MCU 

#define DMA_TX_CHNL 15
#define DMA_RX_CHNL 14

#define ERROR_PIN  (4) //pin which will physically show error in test modes , can be connected to and LED as well 
#define ERROR_GPIO  GPIOD



/*******************************************************************************
 * Enums
 ******************************************************************************/

/*******************************************************************************
 * Structs
 ******************************************************************************/

 /*******************************************************************************
 * Prototypes
 ******************************************************************************/
#if defined(__cplusplus)
extern "C" {
#endif
/*******************************************************************************
 * Variables
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/

#if defined(__cplusplus)
}
#endif
#endif
/* EOF */