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


/*******************************************************************************
 * Defines
 ******************************************************************************/
#define DEF_FRMSIZE (8)

#define TIME_BW_TSFR_NS 0
#define  PCS_TO_CLK 35

/*******************************************************************************
 * Enums
 ******************************************************************************/

/*******************************************************************************
 * Structs
 ******************************************************************************/

 /*******************************************************************************
 * Prototypes
 ******************************************************************************/
static void StartSpiTransfer();
static void ClearSpiFlags();

/*******************************************************************************
 * Variables
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/
 
  static void StartSpiTransfer()
{
	SPI_MODULE_NO->MCR &= ~(SPI_MCR_HALT(1)); 
}

static void ClearSpiFlags()
{
 SPI2->SR  = SPI_SR_RFDF(1) | SPI_SR_TCF(1) | SPI_SR_TFFF(1) ;
}



 
 void SpiInit()
{
//  initialize pins and clock
	SIM->SCGC5 |= SIM_SCGC5_PORTD(1);
	
	PORTD->PCR[11] = PORT_PCR_MUX(2);
	PORTD->PCR[12] = PORT_PCR_MUX(2);
	PORTD->PCR[13] = PORT_PCR_MUX(2);
	PORTD->PCR[14] = PORT_PCR_MUX(2);
	
//	SPI clock enable
	clock_ip_name_t const s_dspiClock[] = DSPI_CLOCKS;
	CLOCK_EnableClock(s_dspiClock[DSPI_GetInstance(SPI_MODULE_NO)]);
	
//SPI registers update
	uint32_t temp = 0;
	SPI_MODULE_NO->MCR = SPI_MCR_HALT_MASK | SPI_MCR_MSTR_MASK | SPI_MCR_PCSIS(1)  | SPI_MCR_ROOE_MASK | SPI_MCR_CONT_SCKE(CONT_CLCK_ENABLE);
	DSPI_MasterSetBaudRate(SPI_MODULE_NO,kDSPI_Ctar0, DEF_BAUDRATE,CLOCK_GetFreq(DSPI2_CLK_SRC));
	temp = SPI_MODULE_NO->CTAR[0] & ~(SPI_CTAR_FMSZ_MASK);
	SPI_MODULE_NO->CTAR[0] = temp | SPI_CTAR_FMSZ(DEF_FRMSIZE-1);
	(void)DSPI_MasterSetDelayTimes(SPI_MODULE_NO, kDSPI_Ctar0, kDSPI_BetweenTransfer, CLOCK_GetFreq(DSPI2_CLK_SRC), TIME_BW_TSFR_NS);
	(void)DSPI_MasterSetDelayTimes(SPI_MODULE_NO, kDSPI_Ctar0, kDSPI_PcsToSck, CLOCK_GetFreq(DSPI2_CLK_SRC), PCS_TO_CLK);
  (void)DSPI_MasterSetDelayTimes(SPI_MODULE_NO, kDSPI_Ctar0, kDSPI_LastSckToPcs, CLOCK_GetFreq(DSPI2_CLK_SRC), PCS_TO_CLK);
	
	StartSpiTransfer();
  
}


void HaltSpiTransfer()
{
	SPI_MODULE_NO->MCR = SPI_MCR_HALT_MASK;
}

 void SpiDeInit()
{
	//  de initialize pins and clock
	SIM->SCGC5 |= SIM_SCGC5_PORTD(0);
	
	PORTD->PCR[11] = PORT_PCR_MUX(2);
	PORTD->PCR[12] = PORT_PCR_MUX(2);
	PORTD->PCR[13] = PORT_PCR_MUX(2);
	PORTD->PCR[14] = PORT_PCR_MUX(2);
	
	SIM->SCGC3 = SIM_SCGC3_SPI2(0);
}




 void SendDummy()
{
	uint16_t dummy =0;
	if(spiI2Props.frameSize == FRAME_SIZE8)
			dummy = (uint8_t)dummy;
	
	SPI2->PUSHR = SPI_PUSHR_TXDATA(dummy) |  SPI_PUSHR_PCS(1) ;  
	while ((SPI2->SR & SPI_SR_RFDF_MASK)==0)
	 {}
		(void)SPI2->POPR; 
		SPI2->SR  = SPI_SR_RFDF(1) | SPI_SR_TCF(1);
}


 void SendSpi(uint16_t txdata)
{
	if(spiI2Props.frameSize == FRAME_SIZE8)
			txdata = (uint8_t)txdata;
	
	SPI2->PUSHR = SPI_PUSHR_TXDATA(txdata) |  SPI_PUSHR_PCS(1) ; 
	while ((SPI2->SR & SPI_SR_RFDF_MASK)==0)
	 {}
		 (void)SPI2->POPR;
		SPI2->SR  = SPI_SR_RFDF(1) | SPI_SR_TCF(1);		 
}


 uint16_t ReadSpi()
{
		uint16_t dummy =0;
	if(spiI2Props.frameSize == FRAME_SIZE8)
			dummy = (uint8_t)dummy;
	
	SPI2->PUSHR = SPI_PUSHR_TXDATA(dummy) |  SPI_PUSHR_PCS(1) ;  
	while ((SPI2->SR & SPI_SR_RFDF_MASK) == 0)
	 {}
		(void)SPI2->POPR; 
		SPI2->SR  = SPI_SR_RFDF(1) | SPI_SR_TCF(1);
	
		 dummy = SPI2->POPR;	 
		 return dummy;
}

 uint16_t ReadSpiBurst()
{
		uint16_t dummy =0;
	if(spiI2Props.frameSize == FRAME_SIZE8)
			dummy = (uint8_t)dummy;
	
	SPI2->PUSHR = SPI_PUSHR_TXDATA(dummy) |  SPI_PUSHR_PCS(1)  | SPI_PUSHR_CONT(1);  
	while ((SPI2->SR & SPI_SR_RFDF_MASK) == 0)
	 {}
		(void)SPI2->POPR; 
		SPI2->SR  = SPI_SR_RFDF(1) | SPI_SR_TCF(1);
	
		 dummy = SPI2->POPR;	 
		 return dummy;
}

/* EOF */