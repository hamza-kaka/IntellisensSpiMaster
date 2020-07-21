/*! 
@file TestMode3.c
@brief  tests if mode 3 (continous single result) of I2 is working fine via SPI 
@details 

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
*/
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "spiParams.h"
#include "I2Commands.h"
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

  /*!
 @brief  tests mode 3, checking channel independence and data intregrity in both frames and different conversion rates 
 @param  none 
 @returns  true if test is cleared and false if test is failed 
 */
bool AutoTestMode3()
{
	short resultCh1[250]={0}, resultCh2[250]={0}, temp=0, testNum =250;
	float success = 0, mult = 0.0;
	bool error=0;
	
	SetRunMode(CONT_SINGLE);
	
	frame16test:
	
	ChnlEnable(1);
	SendStartConv();
	ReadReg16(REGRCH2,resultCh2); 
	WaitTillIdle();
	ReadReg16(REGRCH2,&temp);
	WaitTillIdle();
	SendStopConv();
	if(resultCh2[0] != temp) //if channel 2 result is active, it means channel selection doesnt work 
		error = true;
	
	SysTickDelayUs(3); // for the ADC and DMA to complete its calculation of prev channel
	
	ChnlEnable(2);
	SendStartConv();
	ReadReg16(REGRCH1,resultCh1); 
	WaitTillIdle();
	ReadReg16(REGRCH1,&temp); 
	WaitTillIdle();
	SendStopConv();
	if(resultCh1[0] != temp)
		error = true;
	
	ChnlEnable(3); // both channels are active 
	SendStartConv();
	for(int a=0; a<testNum; a++)
	{
		ReadReg16(REGRCH1,&resultCh1[a]); 
		WaitTillIdle();
		ReadReg16(REGRCH2,&resultCh2[a]); 
		WaitTillIdle();
		if(resultCh1[a] == 0 || resultCh2[a] == 0)
			success++;
	}
	SendStopConv();
	
	#if CURRENT_COMP_TEST
	
			for (int a=0; a<testNum ; a++)
		{	
			if (fabsf((float)resultCh1[a]*mult - CH1_CUR_VAL)/CH1_CUR_VAL > 0.1) // 10% error
				error = true;
			if (fabsf((float)resultCh2[a]*mult - CH2_CUR_VAL)/CH2_CUR_VAL > 0.1) // 10% error
			  error = true;
		}
	
	#else
	success = (success / ((float)testNum*2))*100;
	if(success >30)
		error = true;
	
	#endif
	
	if(spiI2Props.frameSize == FRAME_SIZE8)
	{
		FrameSizeSet(FRAME_SIZE16);
		SetConvRate(1500);
		success = 0;
		goto frame16test;
	}
	else 
	{
		FrameSizeSet(FRAME_SIZE8);
		SetConvRate(500000);
	}
	
	return !error;
}




/* EOF */