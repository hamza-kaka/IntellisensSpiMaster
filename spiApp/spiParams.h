/*! 
@file spiParams.h
@brief  definitions and vars for SPI communication 
@details  defiinitions related to the SPI comm of I2

@author Hamza Naeem Kakakhel
@copyright Taraz Technologies Pvt. Ltd.
 */
#ifndef  SPI_PARAMS_h
#define  SPI_PARAMS_h
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "fsl_common.h"
#include "clock_config.h"
#include "pin_mux.h"
#include "fsl_dspi.h"
#include "fsl_pit.h"
#include "fsl_edma.h"
#include "fsl_dmamux.h"
#include "math.h"
#include "UserConfig.h"

/*******************************************************************************
 * Defines
 ******************************************************************************/
#define NO_OF_MODES (4)


#define FRAME_SIZE8 (8)
#define FRAME_SIZE16 (16)

#define CHNL1 (1)
#define CHNL2 (2)
 
#define BURST_512 (512)
#define BURST_256 (256)
#define BURST_128 (128)
#define BURST_64 (64)
#define BURST_32 (32)
#define BURST_16 (16)
#define BURST_8 (8)
#define BURST_4 (4)

#define REGSTATUS 0x81
#define REGSTOP 0x01
#define REGSTART 0x02
#define REGWCFG1 0x03
#define REGWCFG2 0x04
#define REGWCFG3 0x05
#define REGRCFG1 0x83
#define REGRCFG2 0x84
#define REGRCFG3 0x85
#define REGRCH1 0x86
#define REGRCH2 0x87
#define REGRCMR 0x88
#define REGRRM 0x89


/*******************************************************************************
 * Enums
 ******************************************************************************/
typedef enum{
	ONCE_SINGLE = 1,
	ONCE_BURST,
	CONT_SINGLE,
	CONT_BURST
	
} run_mode_t;

typedef enum{
	BURST512 = 0,
	BURST256,
	BURST128,
	BURST64,
	BURST32,
	BURST16,
	BURST8,
	BURST4
	
} burst_size_t;

/*******************************************************************************
 * Structs
 ******************************************************************************/
 typedef  struct{
	uint8_t frameSize;
	
	bool chnl1En;
	bool chnl2En;
	bool continous;
	bool burst;
	bool dmaActive;
	int activeChnls;
	
	run_mode_t runMode;
	
	uint16_t burstSize;
	uint32_t convRate;
	
} spi_i2_props_t;

 /*******************************************************************************
 * Prototypes
 ******************************************************************************/
#if defined(__cplusplus)
extern "C" {
#endif

	void InitSetup();
	void FrameSizeSet(uint8_t size);
	void ChnlEnable(uint8_t chnl_no);
	void EnableContMode(bool enable);
	void SetBurst(bool burst, int burstSize);
	void SetConvRate(int samplesPerSec);
	void SetRunMode(uint8_t mode);

	bool AutoTestMode1();
	bool AutoTestMode2();
	bool AutoTestMode3();
	bool AutoTestMode4();
	void AutoTestComplete(bool * testResults);
	
	void WriteReg8(uint8_t add, uint8_t cmd);
	void WriteReg16(uint8_t add, uint16_t cmd);
	void ReadReg8(uint8_t add, uint8_t* data);
	void ReadReg16(uint8_t add, short* data);
	void ReadReg32(uint8_t add, int* data);
	void ReadBurst16(uint8_t add, short* buffer);
	void ReadBurst32(uint8_t add, int* buffer);
	void SendStopConv();
	void SendStartConv();
	void WaitTillIdle();
	
	
/*******************************************************************************
 * Variables
 ******************************************************************************/
extern spi_i2_props_t spiI2Props;

/*******************************************************************************
 * Code
 ******************************************************************************/

#if defined(__cplusplus)
}
#endif
#endif
/* EOF */