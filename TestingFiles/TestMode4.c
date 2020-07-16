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

extern bool convRateTest;

/*******************************************************************************
 * Code
 ******************************************************************************/
bool AutoTestMode4()
{
	short resultChnls[BURST_512], resultCh1[BURST_512/2], resultCh2[BURST_512/2] = {0}, testNum =100;
	float success = 0, mult = 0.0, dif = 0, time =0.0;
	volatile float expConvRate = 0, bufferCount = 0;
	bool error=0;


	SetRunMode(CONT_BURST);
	FrameSizeSet(FRAME_SIZE16);
	
	frame16test:
	
	
	#if(BURST_CHNL_IND_CHCK)
	
	ChnlEnable(1);
	SendStartConv();
	ReadBurst16(REGRCH1,resultChnls); 
	SendStopConv();
	
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
	
		for (int a=0; a<spiI2Props.burstSize/2 ; a++)
	{
		resultCh1[a] = resultChnls[a*2];
		resultCh2[a] = resultChnls[(a*2)+1];
		if (abs(resultCh1[a] - resultCh2[a]) < 0xA4) // A4 stands for almost 0.5 amps difference
			error = true;
	}
		
	#endif
	
	if(spiI2Props.frameSize == FRAME_SIZE16)
		convRateTest = true;
	else 
		convRateTest = false;
	
	ChnlEnable(3); // both channels are active
	
	SendStartConv();
	PIT_StartTimer(PIT, kPIT_Chnl_0);
	
	while(!PIT_GetStatusFlags(PIT, kPIT_Chnl_0))
	{
			ReadBurst16(REGRCH1,resultChnls); 
		  bufferCount++;
	}
	
	SendStopConv(); 
	PIT_StopTimer(PIT, kPIT_Chnl_0);
	PIT_ClearStatusFlags(PIT, kPIT_Chnl_0,kPIT_TimerFlag);

	
	time  = ((float)(PIT->CHANNEL[kPIT_Chnl_0].LDVAL /*- time*/)/(float)PIT_SOURCE_CLOCK); 
	expConvRate = (((spiI2Props.burstSize*bufferCount)/spiI2Props.activeChnls)/**testNum*/)/time;
	dif = fabsf(expConvRate - spiI2Props.convRate);
	if((dif/spiI2Props.convRate)*100 >5 && spiI2Props.frameSize == FRAME_SIZE16 && (expConvRate < spiI2Props.convRate))
		error = true;
		
	#if CURRENT_COMP_TEST
	
	ReadReg32(REGRRM, (int)mult);

			for (int a=0; a<spiI2Props.burstSize/2 ; a++)
		{
			resultCh1[a] = resultChnls[a*2];
			resultCh2[a] = resultChnls[(a*2)+1];
	
			if (fabsf((float)resultCh1[a]*(float)mult - CH1_CUR_VAL)/CH1_CUR_VAL > 0.1) // 10% error
				error = true;
			if (fabsf((float)resultCh2[a]*(float)mult - CH2_CUR_VAL)/CH2_CUR_VAL > 0.1) // 10% error
			  error = true;
		}
	
	#endif
		
	#if !(CURRENT_COMP_TEST || BURST_CHNL_IND_CHCK)
	
		for(int b=0; b<spiI2Props.burstSize; b++)
		{
			if(resultChnls[b] == 0)
			success++;
		}
	
	success = (success / ((float)spiI2Props.burstSize))*100;
	if(success >30)
		error = true;
	
	#endif
	
	
	if(spiI2Props.frameSize == FRAME_SIZE16)
	{
		FrameSizeSet(FRAME_SIZE8);
		SetConvRate(1500);
		SetBurst(true, BURST4);
		success = 0;
		convRateTest = false;
		goto frame16test;
	}
	else 
	{
		SetBurst(true, BURST512);
		SetConvRate(500000);
	}
	
	return !error;
}




/* EOF */