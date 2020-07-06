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
#include "spiComm.h" 
#include "timers.h" 
#include "dma.h" 
#include "I2Commands.h"

/*******************************************************************************
 * Defines
 ******************************************************************************/
#define CHNL1MASK 0x40
#define CHNL2MASK 0x80
#define CONTMASK 0x20
#define BURSTMASK 0x10
#define BURSTSIZEMASK 0x0E
#define BURSTSIZESHIFT 0x01

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

bool frmSizeChange = false;
bool convRateTest = false;

burst_size_t burstSizeEnum = BURST512;

/*******************************************************************************
 * Code
 ******************************************************************************/
 
 void ActivateSlaveSpi()
{
	uint8_t temp =0;
   SendSpi(0x0); 
		while(temp == 0 )
	{
		SendSpi(REGSTATUS);
		temp = ReadSpi();
	}
	
	SetConvRate(500000);
}

 void FrameSizeSet(uint8_t size)
{
	int temp = 0;
	frmSizeChange = true;
	
	
	if(spiI2Props.frameSize == FRAME_SIZE16 && size == 8)
	{
		WaitTillIdle();
		WriteReg16(REGWCFG1, 0);
		temp = SPI_MODULE_NO->CTAR[0] & ~(SPI_CTAR_FMSZ_MASK);
		SPI_MODULE_NO->CTAR[0] = temp | SPI_CTAR_FMSZ(size-1);
		spiI2Props.frameSize = FRAME_SIZE8;
	}
	
	else if (spiI2Props.frameSize == FRAME_SIZE8 && size == 16)
	{
		WaitTillIdle();
		WriteReg8(REGWCFG1, 1);
		temp = SPI_MODULE_NO->CTAR[0] & ~(SPI_CTAR_FMSZ_MASK);
		SPI_MODULE_NO->CTAR[0] = temp | SPI_CTAR_FMSZ(size-1);
		spiI2Props.frameSize = FRAME_SIZE16;
	}
	
	frmSizeChange = false;
	WaitTillIdle();
	
	return;

}

void ChnlEnable(uint8_t chnl_no)// 1 for chnl 1, 2 for 2, and 3 for both channels
{
	if(chnl_no <1 && chnl_no >3) 
		return; // error

	uint8_t temp=0, check=0;
	
	set_again:
	ReadReg8(REGRCFG2,&temp);
	temp &= ~(CHNL1MASK | CHNL2MASK);
	switch(chnl_no)
	{
		case 1:
			check = (temp | CHNL1MASK);
			spiI2Props.chnl1En = true;
			spiI2Props.chnl2En = false;
		  spiI2Props.activeChnls =1;
			WriteReg8(REGWCFG2, check);  
		break;
		case 2:
			check  = (temp | CHNL2MASK);
			spiI2Props.chnl1En = false;
			spiI2Props.chnl2En = true;
			spiI2Props.activeChnls =1;
			WriteReg8(REGWCFG2, check);  
		break;
		case 3:
			check = (temp | CHNL1MASK | CHNL2MASK);
			spiI2Props.chnl1En = true;
			spiI2Props.chnl2En = true;
			spiI2Props.activeChnls =2;
			WriteReg8(REGWCFG2, check);  
		break;
	}
		
	ReadReg8(REGRCFG2,&temp);
	if(check != temp)
		goto set_again;
	
	
}

void EnableContMode(bool enable)
{
	uint8_t temp=0, check=0;
	
	set_again:
	ReadReg8(REGRCFG2,&temp);
	if(enable)
	{
		check = temp | CONTMASK;
		spiI2Props.continous = true;
	}
	else 
	{
		check = temp & ~(CONTMASK);
		spiI2Props.continous = false;
	}
	
	WriteReg8(REGWCFG2, check);  
	ReadReg8(REGRCFG2,&temp);
	if(check != temp)
		goto set_again;
}

void SetBurst(bool burst, int burstSize)
{
	if(!burst)
	{
		uint8_t temp=0, check=0;
		spiI2Props.burst = false;
		set_disable_again:
		ReadReg8(REGRCFG2,&temp);
		check = temp & ~(BURSTMASK);
		WriteReg8(REGWCFG2, check);  
		ReadReg8(REGRCFG2,&temp);
		if(check != temp)
			goto set_disable_again;
	}
	else 
	{
		burstSizeEnum = burstSize;
		uint8_t temp=0, check=0;
		spiI2Props.burst = true;
		spiI2Props.burstSize = BURST_512 >> burstSize;
		set_enable_again:
		ReadReg8(REGRCFG2,&temp);
		check = temp & ~(BURSTSIZEMASK);
		check |=  BURSTMASK | (burstSizeEnum<<BURSTSIZESHIFT);
		WriteReg8(REGWCFG2, check);  
		ReadReg8(REGRCFG2,&temp);
		if(check != temp)
			goto set_enable_again;
	}
}

void SetConvRate(int samplesPerSec)
{
	uint16_t crdiv = (48*1000000) /samplesPerSec;
	samplesPerSec = (48.0/crdiv) * 1000000.0;
	spiI2Props.convRate = samplesPerSec;
	
	uint16_t temp=0, check=crdiv;
	
	set_again:
	
	WriteReg16(REGWCFG3, check);  
	ReadReg16(REGRCFG3,&temp);
	if(check != temp)
		goto set_again;
}

void SetRunMode(uint8_t mode)
{
	switch(mode)
	{
		case 1:
			SetBurst(false,burstSizeEnum);
			EnableContMode(false);
			spiI2Props.runMode = mode;
			break;
		case 2:
			SetBurst(true,burstSizeEnum);
			EnableContMode(false);
			spiI2Props.runMode = mode;
			break;
		case 3:
			SetBurst(false,burstSizeEnum);
			EnableContMode(true);
			spiI2Props.runMode = mode;
			break;
		case 4:
			SetBurst(true,burstSizeEnum);
			EnableContMode(true);
			spiI2Props.runMode = mode;
			break;
		default: //error
			return;
	}
}


																										/********************************************************************************** dynamically used functions **********************************************************************************/


void ReadBurst16(uint8_t add, short* buffer)
{
	WaitTillIdle();
	SendSpi(add);
	SysTickDelayUs(2.5);
	
	if(convRateTest)
	{
		short dummy = 0;
		StartDma(buffer, &dummy );
		while(spiI2Props.dmaActive){}
			
		StopDma();
	}
	else 
	{
			for(int a=0; a<spiI2Props.burstSize;a++)
		{	
			buffer[a] = 0;
			if(spiI2Props.frameSize == FRAME_SIZE16)
			{
				buffer[a] = ReadSpiBurst();
			}
			else if(spiI2Props.frameSize == FRAME_SIZE8)
			{
				buffer[a] = ReadSpiBurst();
				buffer[a] = buffer[a] << 8;
				buffer[a] |= ReadSpiBurst();
			}
		}
	}
}

void ReadBurst32(uint8_t add, int* buffer)
{
	WaitTillIdle();
	SendSpi(add);
	SysTickDelayUs(2.5);
	
	for(int a=0; a<spiI2Props.burstSize/2;a++)
	{	
		buffer[a] = 0;
		if(spiI2Props.frameSize == FRAME_SIZE16)
		{
			buffer[a] = ReadSpiBurst();
			buffer[a] = buffer[a] << 16;
			buffer[a] |= ReadSpiBurst();
		}
		else if(spiI2Props.frameSize == FRAME_SIZE8)
		{
		
			buffer[a] = ReadSpiBurst();
			for(int b =0; b<3; b++)
			{
				buffer[a] = buffer[a] << 8;			
				buffer[a] |= ReadSpiBurst();
			}
		}
	}
}

void SendStopConv()
{
	SendSpi(0x01);
	SysTickDelayUs(2.5);
	
	WaitTillIdle();
}

void SendStartConv()
{
	SendSpi(0x02);
	SysTickDelayUs(2.5);
	
	WaitTillIdle();
}

void WriteReg8(uint8_t add, uint8_t cmd)
{
	SendSpi(add);
	SysTickDelayUs(2.5);
	SendSpi(cmd);
	SysTickDelayUs(2.5);
	
	if(!frmSizeChange)
		WaitTillIdle();
}

void WriteReg16(uint8_t add, uint16_t cmd)
{
	if(spiI2Props.frameSize == FRAME_SIZE16)
	{
		SendSpi(add);
		SysTickDelayUs(2.5);
		SendSpi(cmd);
		SysTickDelayUs(2.5);
	}
	else if(spiI2Props.frameSize == FRAME_SIZE8)
	{
		uint8_t temp;
		temp = cmd;
		cmd = cmd>>8;
		SendSpi(add);
		SysTickDelayUs(2.5);
		SendSpi(cmd);
		SysTickDelayUs(2.5);
		SendSpi(temp);
		SysTickDelayUs(2.5);
	}
	
	if(!frmSizeChange)
		WaitTillIdle();
}

void ReadReg8(uint8_t add, uint8_t* data)
{
	WaitTillIdle();
	
	SendSpi(add);
	SysTickDelayUs(2.5);
	*data = ReadSpi();
	SysTickDelayUs(2.5);
}


void ReadReg16(uint8_t add, short* data)
{
	WaitTillIdle();
	
	*data = 0;
	if(spiI2Props.frameSize == FRAME_SIZE16)
	{
		SendSpi(add);
		SysTickDelayUs(2.5);
		*data = ReadSpi();
		SysTickDelayUs(2.5);
	}
	else if(spiI2Props.frameSize == FRAME_SIZE8)
	{
		SendSpi(add);
		SysTickDelayUs(2.5);
		*data = ReadSpi();
		*data = *data << 8;
		SysTickDelayUs(2.5);
		*data |= ReadSpi();
		SysTickDelayUs(2.5);
	}
	
}

void ReadReg32(uint8_t add, int* data)
{
	WaitTillIdle();
	
	*data = 0;
	if(spiI2Props.frameSize == FRAME_SIZE16)
	{
		SendSpi(add);
		SysTickDelayUs(2.5);
		*data = ReadSpi();
		*data = *data << 16;
		SysTickDelayUs(2.5);
		*data |= ReadSpi();
		SysTickDelayUs(2.5);
	}
	else if(spiI2Props.frameSize == FRAME_SIZE8)
	{
		SendSpi(add);
		SysTickDelayUs(2.5);
		*data = ReadSpi();
		for(int a =0; a<3; a++)
		{
			*data = *data << 8;
			 SysTickDelayUs(2.5);
			*data |= ReadSpi();
		}
	}
}



void WaitTillIdle()
{
	uint8_t temp=0;
		while(temp == 0 )
	{
		SendSpi(REGSTATUS);
		temp = ReadSpi();
	}
}

/* EOF */