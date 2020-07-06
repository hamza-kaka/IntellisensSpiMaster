; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\spicomm.o --depend=.\objects\spicomm.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\spicomm.crf ..\..\SpiCommunication\spiComm.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.ClearSpiFlags||, CODE, READONLY, ALIGN=2

ClearSpiFlags PROC
        LDR      r0,|L1.8|
        LDR      r1,|L1.12|
        STR      r0,[r1,#0x2c]
        BX       lr
        ENDP

|L1.8|
        DCD      0x82020000
|L1.12|
        DCD      0x400ac000

        AREA ||i.HaltSpiTransfer||, CODE, READONLY, ALIGN=2

HaltSpiTransfer PROC
        MOVS     r0,#1
        LDR      r1,|L2.8|
        STR      r0,[r1,#0]
        BX       lr
        ENDP

|L2.8|
        DCD      0x400ac000

        AREA ||i.ReadSpi||, CODE, READONLY, ALIGN=2

ReadSpi PROC
        MOVS     r0,#0
        LDR      r1,|L3.56|
        LDRB     r1,[r1,#0]  ; spiI2Props
        CMP      r1,#8
        BNE      |L3.12|
        UXTB     r0,r0
|L3.12|
        UXTH     r1,r0
        ORR      r1,r1,#0x10000
        LDR      r2,|L3.60|
        STR      r1,[r2,#0x34]
        NOP      
|L3.24|
        LDR      r1,|L3.60|
        LDR      r1,[r1,#0x2c]
        AND      r1,r1,#0x20000
        CMP      r1,#0
        BEQ      |L3.24|
        LDR      r1,|L3.60|
        LDR      r1,[r1,#0x38]
        LDR      r1,|L3.64|
        LDR      r2,|L3.60|
        STR      r1,[r2,#0x2c]
        MOV      r1,r2
        LDR      r1,[r1,#0x38]
        UXTH     r0,r1
        BX       lr
        ENDP

        DCW      0x0000
|L3.56|
        DCD      spiI2Props
|L3.60|
        DCD      0x400ac000
|L3.64|
        DCD      0x80020000

        AREA ||i.ReadSpiBurst||, CODE, READONLY, ALIGN=2

ReadSpiBurst PROC
        MOVS     r0,#0
        LDR      r1,|L4.60|
        LDRB     r1,[r1,#0]  ; spiI2Props
        CMP      r1,#8
        BNE      |L4.12|
        UXTB     r0,r0
|L4.12|
        UXTH     r1,r0
        ORR      r1,r1,#0x10000
        ORR      r1,r1,#0x80000000
        LDR      r2,|L4.64|
        STR      r1,[r2,#0x34]
        NOP      
|L4.28|
        LDR      r1,|L4.64|
        LDR      r1,[r1,#0x2c]
        AND      r1,r1,#0x20000
        CMP      r1,#0
        BEQ      |L4.28|
        LDR      r1,|L4.64|
        LDR      r1,[r1,#0x38]
        LDR      r1,|L4.68|
        LDR      r2,|L4.64|
        STR      r1,[r2,#0x2c]
        MOV      r1,r2
        LDR      r1,[r1,#0x38]
        UXTH     r0,r1
        BX       lr
        ENDP

        DCW      0x0000
|L4.60|
        DCD      spiI2Props
|L4.64|
        DCD      0x400ac000
|L4.68|
        DCD      0x80020000

        AREA ||i.SendDummy||, CODE, READONLY, ALIGN=2

SendDummy PROC
        MOVS     r0,#0
        LDR      r1,|L5.48|
        LDRB     r1,[r1,#0]  ; spiI2Props
        CMP      r1,#8
        BNE      |L5.12|
        UXTB     r0,r0
|L5.12|
        UXTH     r1,r0
        ORR      r1,r1,#0x10000
        LDR      r2,|L5.52|
        STR      r1,[r2,#0x34]
        NOP      
|L5.24|
        LDR      r1,|L5.52|
        LDR      r1,[r1,#0x2c]
        AND      r1,r1,#0x20000
        CMP      r1,#0
        BEQ      |L5.24|
        LDR      r1,|L5.52|
        LDR      r1,[r1,#0x38]
        LDR      r1,|L5.56|
        LDR      r2,|L5.52|
        STR      r1,[r2,#0x2c]
        BX       lr
        ENDP

|L5.48|
        DCD      spiI2Props
|L5.52|
        DCD      0x400ac000
|L5.56|
        DCD      0x80020000

        AREA ||i.SendSpi||, CODE, READONLY, ALIGN=2

SendSpi PROC
        LDR      r1,|L6.48|
        LDRB     r1,[r1,#0]  ; spiI2Props
        CMP      r1,#8
        BNE      |L6.10|
        UXTB     r0,r0
|L6.10|
        UXTH     r1,r0
        ORR      r1,r1,#0x10000
        LDR      r2,|L6.52|
        STR      r1,[r2,#0x34]
        NOP      
|L6.22|
        LDR      r1,|L6.52|
        LDR      r1,[r1,#0x2c]
        AND      r1,r1,#0x20000
        CMP      r1,#0
        BEQ      |L6.22|
        LDR      r1,|L6.52|
        LDR      r1,[r1,#0x38]
        LDR      r1,|L6.56|
        LDR      r2,|L6.52|
        STR      r1,[r2,#0x2c]
        BX       lr
        ENDP

        DCW      0x0000
|L6.48|
        DCD      spiI2Props
|L6.52|
        DCD      0x400ac000
|L6.56|
        DCD      0x80020000

        AREA ||i.SpiDeInit||, CODE, READONLY, ALIGN=2

SpiDeInit PROC
        LDR      r0,|L7.28|
        LDR      r0,[r0,#0x38]
        LDR      r1,|L7.28|
        STR      r0,[r1,#0x38]
        ASRS     r0,r1,#21
        LDR      r1,|L7.32|
        STR      r0,[r1,#0x2c]
        STR      r0,[r1,#0x30]
        STR      r0,[r1,#0x34]
        STR      r0,[r1,#0x38]
        MOVS     r0,#0
        LDR      r1,|L7.28|
        STR      r0,[r1,#0x30]
        BX       lr
        ENDP

|L7.28|
        DCD      0x40048000
|L7.32|
        DCD      0x4004c000

        AREA ||i.SpiInit||, CODE, READONLY, ALIGN=2

SpiInit PROC
        PUSH     {r0-r6,lr}
        LDR      r0,|L8.188|
        LDR      r0,[r0,#0x38]
        ORR      r0,r0,#0x1000
        LDR      r1,|L8.188|
        STR      r0,[r1,#0x38]
        ASRS     r0,r1,#21
        LDR      r1,|L8.192|
        STR      r0,[r1,#0x2c]
        STR      r0,[r1,#0x30]
        STR      r0,[r1,#0x34]
        STR      r0,[r1,#0x38]
        LDR      r2,|L8.196|
        LDM      r2,{r0-r2}
        ADD      r3,sp,#4
        STM      r3!,{r0-r2}
        LDR      r0,|L8.200|
        BL       DSPI_GetInstance
        ADD      r1,sp,#4
        LDR      r4,[r1,r0,LSL #2]
        LDR      r1,|L8.204|
        ADD      r0,r1,r4,LSR #16
        LDR      r1,[r0,#0]
        MOVS     r2,#1
        LSLS     r2,r2,r4
        ORRS     r1,r1,r2
        STR      r1,[r0,#0]
        NOP      
        MOVS     r5,#0
        LDR      r0,|L8.208|
        LDR      r1,|L8.200|
        STR      r0,[r1,#0]
        MOVS     r0,#2
        BL       CLOCK_GetFreq
        MOV      r4,r0
        MOV      r3,r4
        LDR      r2,|L8.212|
        MOVS     r1,#0
        LDR      r0,|L8.200|
        BL       DSPI_MasterSetBaudRate
        LDR      r0,|L8.200|
        LDR      r0,[r0,#0xc]
        BIC      r5,r0,#0x78000000
        ORR      r0,r5,#0x38000000
        LDR      r1,|L8.200|
        STR      r0,[r1,#0xc]
        MOVS     r0,#2
        BL       CLOCK_GetFreq
        MOV      r4,r0
        MOVS     r0,#0
        MOV      r3,r4
        MOVS     r2,#3
        MOV      r1,r0
        STR      r0,[sp,#0]
        LDR      r0,|L8.200|
        BL       DSPI_MasterSetDelayTimes
        MOVS     r0,#2
        BL       CLOCK_GetFreq
        MOV      r4,r0
        MOVS     r0,#0x23
        MOV      r3,r4
        MOVS     r2,#1
        MOVS     r1,#0
        STR      r0,[sp,#0]
        LDR      r0,|L8.200|
        BL       DSPI_MasterSetDelayTimes
        MOVS     r0,#2
        BL       CLOCK_GetFreq
        MOV      r4,r0
        MOVS     r0,#0x23
        MOV      r3,r4
        MOVS     r2,#2
        MOVS     r1,#0
        STR      r0,[sp,#0]
        LDR      r0,|L8.200|
        BL       DSPI_MasterSetDelayTimes
        BL       StartSpiTransfer
        POP      {r0-r6,pc}
        ENDP

        DCW      0x0000
|L8.188|
        DCD      0x40048000
|L8.192|
        DCD      0x4004c000
|L8.196|
        DCD      ||.constdata||
|L8.200|
        DCD      0x400ac000
|L8.204|
        DCD      0x40047000
|L8.208|
        DCD      0x81010001
|L8.212|
        DCD      0x016e3600

        AREA ||i.StartSpiTransfer||, CODE, READONLY, ALIGN=2

StartSpiTransfer PROC
        LDR      r0,|L9.16|
        LDR      r0,[r0,#0]
        BIC      r0,r0,#1
        LDR      r1,|L9.16|
        STR      r0,[r1,#0]
        BX       lr
        ENDP

        DCW      0x0000
|L9.16|
        DCD      0x400ac000

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||.constdata||, DATA, READONLY, ALIGN=2

        DCD      0x103c000c
        DCD      0x103c000d
        DCD      0x1030000c

;*** Start embedded assembler ***

#line 1 "..\\..\\SpiCommunication\\spiComm.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___9_spiComm_c_SpiInit____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___9_spiComm_c_SpiInit____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___9_spiComm_c_SpiInit____REVSH|
#line 483
|__asm___9_spiComm_c_SpiInit____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___9_spiComm_c_SpiInit____RRX|
#line 670
|__asm___9_spiComm_c_SpiInit____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT HaltSpiTransfer [CODE]
        EXPORT ReadSpi [CODE]
        EXPORT ReadSpiBurst [CODE]
        EXPORT SendDummy [CODE]
        EXPORT SendSpi [CODE]
        EXPORT SpiDeInit [CODE]
        EXPORT SpiInit [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT DSPI_GetInstance [CODE]
        IMPORT CLOCK_GetFreq [CODE]
        IMPORT DSPI_MasterSetBaudRate [CODE]
        IMPORT DSPI_MasterSetDelayTimes [CODE]
        IMPORT spiI2Props [DATA]

        KEEP ClearSpiFlags
        KEEP StartSpiTransfer

        ATTR FILESCOPE
        ATTR SETVALUE Tag_ABI_PCS_wchar_t,2
        ATTR SETVALUE Tag_ABI_enum_size,1
        ATTR SETVALUE Tag_ABI_optimization_goals,6
        ATTR SETSTRING Tag_conformance,"2.09"
        ATTR SETVALUE AV,18,1

        ASSERT {ENDIAN} = "little"
        ASSERT {INTER} = {TRUE}
        ASSERT {ROPI} = {FALSE}
        ASSERT {RWPI} = {FALSE}
        ASSERT {IEEE_FULL} = {FALSE}
        ASSERT {IEEE_PART} = {FALSE}
        ASSERT {IEEE_JAVA} = {FALSE}
        END