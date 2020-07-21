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
#include "dma.h"

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
/*! @brief  interrupt handler  */
void DMA14_DMA30_IRQHandler(void)
{
	DMA0->CINT = DMA_CINT_CINT(14);
	spiI2Props.dmaActive = false;

} 

/*! @brief  disables DMA to take ay requests and the SPI module to generate any requests */
void StopDma()
{
	DMA->ERQ = 0;
	SPI_MODULE_NO->RSER =0;
}

/*!
@brief  enables DMA requests and stsrts DMA 
@param  var to store data read from the SPI module in 
@param dummy data to send via SPI module 
*/
void StartDma(short* resBuffer, short* dummy)
{
	SPI_MODULE_NO->RSER = SPI_RSER_RFDF_DIRS(1) | SPI_RSER_TFFF_RE(1) | SPI_RSER_RFDF_RE(1) | SPI_RSER_TFFF_DIRS(1);
	DMA->TCD[DMA_RX_CHNL].DADDR = resBuffer;
	DMA->TCD[DMA_TX_CHNL].SADDR = dummy;
	DMA->TCD[DMA_RX_CHNL].BITER_ELINKNO = DMA0->TCD[DMA_RX_CHNL].CITER_ELINKNO = spiI2Props.burstSize;
	DMA->TCD[DMA_TX_CHNL].BITER_ELINKNO = DMA0->TCD[DMA_TX_CHNL].CITER_ELINKNO = spiI2Props.burstSize;
	DMA->ERQ = (1<<DMA_TX_CHNL) | (1<<DMA_RX_CHNL);
	spiI2Props.dmaActive = true;
}



void DmaInit() 
{
	DMAMUX_Init(DMAMUX0);
	DMA_MUX_RD = DMAMUX_CHCFG_SOURCE(DMA_MUX_SPI_RX) | DMAMUX_CHCFG_ENBL(1);
	DMA_MUX_WRT = DMAMUX_CHCFG_SOURCE(DMA_MUX_SPI_TX) | DMAMUX_CHCFG_ENBL(1);
	
	DMA->CR = DMA_CR_GRP0PRI(1);
	
	DMA->TCD[DMA_TX_CHNL].NBYTES_MLNO = 2;
	DMA->TCD[DMA_TX_CHNL].SOFF =  0;
	DMA->TCD[DMA_TX_CHNL].DADDR = WRT_AD;
	DMA->TCD[DMA_TX_CHNL].DOFF = 0;
	DMA->TCD[DMA_TX_CHNL].SLAST = 0;
	DMA->TCD[DMA_TX_CHNL].DLAST_SGA = 0;
	DMA->TCD[DMA_TX_CHNL].ATTR = DMA_ATTR_DSIZE(1) | DMA_ATTR_SSIZE(1);
	DMA->TCD[DMA_TX_CHNL].CSR = DMA_CSR_DREQ(1);
	
	DMA->TCD[DMA_RX_CHNL].NBYTES_MLNO = 2;
	DMA->TCD[DMA_RX_CHNL].SOFF =  0;
	DMA->TCD[DMA_RX_CHNL].SADDR = RD_AD;
	DMA->TCD[DMA_RX_CHNL].DOFF = 2;
	DMA->TCD[DMA_RX_CHNL].SLAST = 0;
	DMA->TCD[DMA_RX_CHNL].DLAST_SGA = 0;
	DMA->TCD[DMA_RX_CHNL].ATTR = DMA_ATTR_DSIZE(1) | DMA_ATTR_SSIZE(1);
	DMA->TCD[DMA_RX_CHNL].CSR = DMA_CSR_DREQ(1) | DMA_CSR_INTMAJOR(1);
	
	NVIC_EnableIRQ(DMA14_DMA30_IRQn);
	
}

/* EOF */