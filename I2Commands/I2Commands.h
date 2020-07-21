/*! 
@file I2Commands.h
@brief  function prototypes for I2 SPI commands
@details 

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
 */
#ifndef I2_SPI_COMMANDS
#define I2_SPI_COMMANDS
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "fsl_common.h"

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
#if defined(__cplusplus)
extern "C" {
#endif

 void ActivateSlaveSpi();
 void FrameSizeSet(uint8_t size);
 void ChnlEnable(uint8_t chnl_no);
 void EnableContMode(bool enable);
 void SetBurst(bool burst, int burstSize);
 void SetConvRate(int samplesPerSec);
 void SetRunMode(uint8_t mode);
 
 void ReadBurst16(uint8_t add, short* buffer);
 void ReadBurst32(uint8_t add, int* buffer);
 void SendStopConv();
 void SendStartConv();
 void WriteReg8(uint8_t add, uint8_t cmd);
 void WriteReg16(uint8_t add, uint16_t cmd);
 void ReadReg8(uint8_t add, uint8_t* data);
 void ReadReg16(uint8_t add, short* data);
 void ReadReg32(uint8_t add, int* data);
 void WaitTillIdle();

/*******************************************************************************
 * Variables
 ******************************************************************************/
extern bool convRateTest ;

/*******************************************************************************
 * Code
 ******************************************************************************/

#if defined(__cplusplus)
}
#endif
#endif
/* EOF */