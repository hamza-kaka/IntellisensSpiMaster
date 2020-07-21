/*! 
@file TestMode2.c
@brief  tests if mode 2 (single burst) of I2 is working fine via SPI
@details 

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
*/
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "spiParams.h"
#include "I2Commands.h"

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
 @brief  tests mode 2, checking channel independence(if selected) and data intregrity in both frames and different conversion rates 
 @param  none 
 @returns  true if test is cleared and false if test is failed 
 */
bool AutoTestMode2()
{
	short resultChnls[BURST_512]={0}, resultCh1[BURST_512/2] = {0}, resultCh2[BURST_512/2] = {0}, testNum =250;
	float success = 0, mult = 0;
	bool error=0;
	
	SetRunMode(ONCE_BURST);
	
	frame16test:
	
	#if (BURST_CHNL_IND_CHCK)
	
	ChnlEnable(1);
	SendStartConv();
	ReadBurst16(REGRCH1,resultChnls); 
	
		for (int a=0; a<spiI2Props.burstSize/2 ; a++)
	{
		resultCh1[a] = resultChnls[a*2];
		resultCh2[a] = resultChnls[(a*2)+1];
		if (abs(resultCh1[a] - resultCh2[a]) < 0xA4) // A4 stands for almost 0.5 amps difference
			error = true;
	}
	
  ChnlEnable(2);
	SendStartConv();
	ReadBurst16(REGRCH1,resultChnls); 
	SendStopConv();
	
		for (int a=0; a<spiI2Props.burstSize/2 ; a++)
	{
		resultCh1[a] = resultChnls[a*2];
		resultCh2[a] = resultChnls[(a*2)+1];
		if (abs(resultCh1[a] - resultCh2[a]) < 0xD0) // A4 stands for almost 0.5 amps difference
			error = true;
	}
		
	#endif
	
	ChnlEnable(3); // both channels are active 
	SendStartConv();
	ReadBurst16(REGRCH1,resultChnls); 
	
	for(int a=0; a<spiI2Props.burstSize; a++)
	{
		if(resultChnls[a] == 0)
			success++;
	}
	
	#if CURRENT_COMP_TEST
	
			for (int a=0; a<spiI2Props.burstSize/2 ; a++)
		{
			resultCh1[a] = resultChnls[a*2];
			resultCh2[a] = resultChnls[(a*2)+1];
	
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
		SetBurst(true, BURST4);
		success = 0;
		goto frame16test;
	}
	else 
	{
		FrameSizeSet(FRAME_SIZE8);
		SetBurst(true, BURST512);
		SetConvRate(500000);
	}
	
	return !error;
}



/* EOF */