; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\fsl_tsi_v4.o --depend=.\objects\fsl_tsi_v4.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\fsl_tsi_v4.crf ..\..\devices\MK66F18\drivers\fsl_tsi_v4.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.TSI_Calibrate||, CODE, READONLY, ALIGN=2

TSI_Calibrate PROC
        PUSH     {r4-r8,lr}
        MOV      r4,r0
        MOV      r6,r1
        CBZ      r6,|L1.12|
        B        |L1.22|
|L1.12|
        MOVS     r2,#0xb5
        ADR      r1,|L1.152|
        ADR      r0,|L1.196|
        BL       __aeabi_assert
|L1.22|
        MOVS     r5,#0
        MOV      r8,r5
        LDR      r0,[r4,#0]
        AND      r0,r0,#0x40
        CBZ      r0,|L1.46|
        MOV      r8,#1
        MOVS     r1,#1
        MOV      r0,r4
        BL       TSI_DisableInterrupts
|L1.46|
        MOVS     r5,#0
        B        |L1.130|
|L1.50|
        MOV      r7,r5
        CMP      r7,#0x10
        BGE      |L1.58|
        B        |L1.70|
|L1.58|
        MOV      r2,#0x1f0
        ADR      r1,|L1.212|
        ADR      r0,|L1.256|
        BL       __aeabi_assert
|L1.70|
        LDR      r0,[r4,#4]
        BFI      r0,r7,#28,#4
        STR      r0,[r4,#4]
        NOP      
        NOP      
        LDR      r0,[r4,#4]
        ORR      r0,r0,#0x400000
        STR      r0,[r4,#4]
        NOP      
        NOP      
|L1.94|
        NOP      
        LDR      r0,[r4,#0]
        MOVS     r1,#4
        ANDS     r0,r0,r1
        AND      r0,r0,#4
        CMP      r0,#0
        BEQ      |L1.94|
        NOP      
        LDR      r0,[r4,#4]
        UXTH     r0,r0
        STRH     r0,[r6,r5,LSL #1]
        MOV      r0,r4
        BL       TSI_ClearStatusFlags
        ADDS     r0,r5,#1
        UXTB     r5,r0
|L1.130|
        CMP      r5,#0x10
        BLT      |L1.50|
        CMP      r8,#0
        BEQ      |L1.148|
        MOVS     r1,#1
        MOV      r0,r4
        BL       TSI_EnableInterrupts
|L1.148|
        POP      {r4-r8,pc}
        ENDP

|L1.152|
        DCB      "..\\..\\devices\\MK66F18\\drivers\\fsl_tsi_v4.c",0
        DCB      0
|L1.196|
        DCB      "calBuff != NULL",0
|L1.212|
        DCB      "..\\..\\devices\\MK66F18\\drivers\\fsl_tsi_v4.h",0
        DCB      0
|L1.256|
        DCB      "channel < FSL_FEATURE_TSI_CHANNEL_COUNT",0

        AREA ||i.TSI_ClearStatusFlags||, CODE, READONLY, ALIGN=2

TSI_ClearStatusFlags PROC
        PUSH     {r4,lr}
        LDR      r3,[r0,#0]
        LDR      r4,|L2.36|
        AND      r2,r3,r4
        AND      r3,r1,#4
        CBZ      r3,|L2.20|
        ORR      r2,r2,#4
|L2.20|
        AND      r3,r1,#0x80000000
        CBZ      r3,|L2.30|
        ORR      r2,r2,#0x80000000
|L2.30|
        STR      r2,[r0,#0]
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L2.36|
        DCD      0x7ffffffb

        AREA ||i.TSI_Deinit||, CODE, READONLY, ALIGN=2

TSI_Deinit PROC
        PUSH     {r4,lr}
        MOVS     r1,#0
        STR      r1,[r0,#0]
        STR      r1,[r0,#4]
        STR      r1,[r0,#8]
        LDR      r1,|L3.32|
        LDR      r3,|L3.36|
        ADD      r2,r3,r1,LSR #16
        LDR      r3,[r2,#0]
        MOVS     r4,#1
        LSLS     r4,r4,r1
        BICS     r3,r3,r4
        STR      r3,[r2,#0]
        NOP      
        POP      {r4,pc}
        ENDP

|L3.32|
        DCD      0x10380005
|L3.36|
        DCD      0x40047000

        AREA ||i.TSI_DisableInterrupts||, CODE, READONLY, ALIGN=2

TSI_DisableInterrupts PROC
        PUSH     {r4,lr}
        MOV      r2,r0
        LDR      r3,[r2,#0]
        LDR      r4,|L4.48|
        AND      r0,r3,r4
        AND      r3,r1,#1
        CBZ      r3,|L4.22|
        BIC      r0,r0,#0x40
|L4.22|
        AND      r3,r1,#2
        CBZ      r3,|L4.32|
        ORR      r0,r0,#0x10000000
|L4.32|
        AND      r3,r1,#4
        CBZ      r3,|L4.42|
        BIC      r0,r0,#0x10000000
|L4.42|
        STR      r0,[r2,#0]
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L4.48|
        DCD      0x7ffffffb

        AREA ||i.TSI_EnableInterrupts||, CODE, READONLY, ALIGN=2

TSI_EnableInterrupts PROC
        PUSH     {r4,lr}
        MOV      r2,r0
        LDR      r3,[r2,#0]
        LDR      r4,|L5.48|
        AND      r0,r3,r4
        AND      r3,r1,#1
        CBZ      r3,|L5.22|
        ORR      r0,r0,#0x40
|L5.22|
        AND      r3,r1,#2
        CBZ      r3,|L5.32|
        BIC      r0,r0,#0x10000000
|L5.32|
        AND      r3,r1,#4
        CBZ      r3,|L5.42|
        ORR      r0,r0,#0x10000000
|L5.42|
        STR      r0,[r2,#0]
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L5.48|
        DCD      0x7ffffffb

        AREA ||i.TSI_EnableModule||, CODE, READONLY, ALIGN=2

TSI_EnableModule PROC
        CBZ      r1,|L6.16|
        LDR      r2,[r0,#0]
        LDR      r3,|L6.32|
        ANDS     r2,r2,r3
        ORR      r2,r2,#0x80
        STR      r2,[r0,#0]
        B        |L6.28|
|L6.16|
        LDR      r2,[r0,#0]
        LDR      r3,|L6.32|
        ANDS     r2,r2,r3
        BIC      r2,r2,#0x80
        STR      r2,[r0,#0]
|L6.28|
        BX       lr
        ENDP

        DCW      0x0000
|L6.32|
        DCD      0x7ffffffb

        AREA ||i.TSI_GetLowPowerModeDefaultConfig||, CODE, READONLY, ALIGN=1

TSI_GetLowPowerModeDefaultConfig PROC
        MOVS     r1,#0
        STR      r1,[r0,#0]
        STR      r1,[r0,#4]
        STR      r1,[r0,#8]
        MOV      r1,#0x190
        STRH     r1,[r0,#0]
        MOVS     r1,#0
        STRH     r1,[r0,#2]
        MOVS     r1,#1
        STRB     r1,[r0,#4]
        MOVS     r1,#0
        STRB     r1,[r0,#5]
        MOVS     r1,#3
        STRB     r1,[r0,#6]
        MOVS     r1,#4
        STRB     r1,[r0,#7]
        MOVS     r1,#0
        STRB     r1,[r0,#8]
        STRB     r1,[r0,#9]
        BX       lr
        ENDP


        AREA ||i.TSI_GetNormalModeDefaultConfig||, CODE, READONLY, ALIGN=1

TSI_GetNormalModeDefaultConfig PROC
        MOVS     r1,#0
        STR      r1,[r0,#0]
        STR      r1,[r0,#4]
        STR      r1,[r0,#8]
        STRH     r1,[r0,#0]
        STRH     r1,[r0,#2]
        MOVS     r1,#1
        STRB     r1,[r0,#4]
        MOVS     r1,#0
        STRB     r1,[r0,#5]
        MOVS     r1,#3
        STRB     r1,[r0,#6]
        MOVS     r1,#4
        STRB     r1,[r0,#7]
        MOVS     r1,#0
        STRB     r1,[r0,#8]
        STRB     r1,[r0,#9]
        BX       lr
        ENDP


        AREA ||i.TSI_Init||, CODE, READONLY, ALIGN=2

TSI_Init PROC
        PUSH     {r4-r8,lr}
        MOV      r5,r0
        MOV      r4,r1
        CBZ      r4,|L9.12|
        B        |L9.22|
|L9.12|
        MOVS     r2,#0x1b
        ADR      r1,|L9.288|
        ADR      r0,|L9.332|
        BL       __aeabi_assert
|L9.22|
        MOVS     r6,#0
        MOVS     r7,#0
        LDR      r0,|L9.348|
        LDR      r2,|L9.352|
        ADD      r1,r2,r0,LSR #16
        LDR      r2,[r1,#0]
        MOVS     r3,#1
        LSLS     r3,r3,r0
        ORRS     r2,r2,r3
        STR      r2,[r1,#0]
        NOP      
        LDR      r0,[r5,#0]
        AND      r0,r0,#0x80
        CBZ      r0,|L9.64|
        MOVS     r6,#1
        MOVS     r1,#0
        MOV      r0,r5
        BL       TSI_EnableModule
|L9.64|
        LDR      r0,[r5,#0]
        AND      r0,r0,#0x40
        CBZ      r0,|L9.82|
        MOVS     r7,#1
        MOVS     r1,#1
        MOV      r0,r5
        BL       TSI_DisableInterrupts
|L9.82|
        LDRB     r0,[r4,#8]
        CBNZ     r0,|L9.166|
        LDRH     r1,[r4,#0]
        MOV      r0,r5
        BL       TSI_SetHighThreshold
        LDRH     r1,[r4,#2]
        MOV      r0,r5
        BL       TSI_SetLowThreshold
        LDRB     r1,[r4,#4]
        MOV      r0,r5
        BL       TSI_SetElectrodeOSCPrescaler
        LDRB     r1,[r4,#6]
        MOV      r0,r5
        BL       TSI_SetReferenceChargeCurrent
        LDRB     r0,[r4,#5]
        LDR      r1,[r5,#0]
        LDR      r2,|L9.356|
        ANDS     r1,r1,r2
        MOV      r2,#0x70000
        AND      r2,r2,r0,LSL #16
        ORRS     r1,r1,r2
        STR      r1,[r5,#0]
        NOP      
        LDRB     r1,[r4,#7]
        MOV      r0,r5
        BL       TSI_SetNumberOfScans
        LDRB     r1,[r4,#8]
        MOV      r0,r5
        BL       TSI_SetAnalogMode
        LDRB     r1,[r4,#9]
        MOV      r0,r5
        BL       TSI_SetOscVoltageRails
        B        |L9.262|
|L9.166|
        LDRH     r1,[r4,#0]
        MOV      r0,r5
        BL       TSI_SetHighThreshold
        LDRH     r1,[r4,#2]
        MOV      r0,r5
        BL       TSI_SetLowThreshold
        LDRB     r1,[r4,#4]
        MOV      r0,r5
        BL       TSI_SetElectrodeOSCPrescaler
        LDRB     r1,[r4,#6]
        MOV      r0,r5
        BL       TSI_SetReferenceChargeCurrent
        LDRB     r1,[r4,#7]
        MOV      r0,r5
        BL       TSI_SetNumberOfScans
        LDRB     r1,[r4,#8]
        MOV      r0,r5
        BL       TSI_SetAnalogMode
        LDRB     r1,[r4,#9]
        MOV      r0,r5
        BL       TSI_SetOscVoltageRails
        LDRB     r0,[r4,#0xa]
        LDR      r1,[r5,#0]
        LDR      r2,|L9.360|
        ANDS     r1,r1,r2
        MOV      r2,#0x70000
        AND      r2,r2,r0,LSL #16
        ORRS     r1,r1,r2
        STR      r1,[r5,#0]
        NOP      
        LDRB     r0,[r4,#0xb]
        LDR      r1,[r5,#0]
        LDR      r2,|L9.364|
        ANDS     r1,r1,r2
        ORR      r1,r1,r0,LSL #17
        STR      r1,[r5,#0]
        NOP      
        NOP      
|L9.262|
        CBZ      r6,|L9.272|
        MOVS     r1,#1
        MOV      r0,r5
        BL       TSI_EnableModule
|L9.272|
        CBZ      r7,|L9.282|
        MOVS     r1,#1
        MOV      r0,r5
        BL       TSI_EnableInterrupts
|L9.282|
        POP      {r4-r8,pc}
        ENDP

        DCW      0x0000
|L9.288|
        DCB      "..\\..\\devices\\MK66F18\\drivers\\fsl_tsi_v4.c",0
        DCB      0
|L9.332|
        DCB      "config != NULL",0
        DCB      0
|L9.348|
        DCD      0x10380005
|L9.352|
        DCD      0x40047000
|L9.356|
        DCD      0x7ff8fffb
|L9.360|
        DCD      0x7ffefffb
|L9.364|
        DCD      0x7ff9fffb

        AREA ||i.TSI_SetAnalogMode||, CODE, READONLY, ALIGN=2

TSI_SetAnalogMode PROC
        LDR      r2,[r0,#0]
        LDR      r3,|L10.20|
        ANDS     r2,r2,r3
        MOV      r3,#0xf000000
        AND      r3,r3,r1,LSL #24
        ORRS     r2,r2,r3
        STR      r2,[r0,#0]
        BX       lr
        ENDP

|L10.20|
        DCD      0x70fffffb

        AREA ||i.TSI_SetElectrodeOSCPrescaler||, CODE, READONLY, ALIGN=2

TSI_SetElectrodeOSCPrescaler PROC
        LDR      r2,[r0,#0]
        LDR      r3,|L11.20|
        ANDS     r2,r2,r3
        MOV      r3,#0xe000
        AND      r3,r3,r1,LSL #13
        ORRS     r2,r2,r3
        STR      r2,[r0,#0]
        BX       lr
        ENDP

|L11.20|
        DCD      0x7fff1ffb

        AREA ||i.TSI_SetHighThreshold||, CODE, READONLY, ALIGN=2

TSI_SetHighThreshold PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        MOV      r5,r1
        MOV      r0,#0xffff
        CMP      r5,r0
        BCS      |L12.16|
        B        |L12.28|
|L12.16|
        MOV      r2,#0x251
        ADR      r1,|L12.40|
        ADR      r0,|L12.84|
        BL       __aeabi_assert
|L12.28|
        LDR      r0,[r4,#8]
        BFI      r0,r5,#16,#16
        STR      r0,[r4,#8]
        POP      {r4-r6,pc}
        ENDP

        DCW      0x0000
|L12.40|
        DCB      "..\\..\\devices\\MK66F18\\drivers\\fsl_tsi_v4.h",0
        DCB      0
|L12.84|
        DCB      "high_threshold < 0xFFFFU",0
        DCB      0
        DCB      0
        DCB      0

        AREA ||i.TSI_SetLowThreshold||, CODE, READONLY, ALIGN=2

TSI_SetLowThreshold PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        MOV      r5,r1
        MOV      r0,#0xffff
        CMP      r5,r0
        BCS      |L13.16|
        B        |L13.28|
|L13.16|
        MOV      r2,#0x243
        ADR      r1,|L13.40|
        ADR      r0,|L13.84|
        BL       __aeabi_assert
|L13.28|
        LDR      r0,[r4,#8]
        BFI      r0,r5,#0,#16
        STR      r0,[r4,#8]
        POP      {r4-r6,pc}
        ENDP

        DCW      0x0000
|L13.40|
        DCB      "..\\..\\devices\\MK66F18\\drivers\\fsl_tsi_v4.h",0
        DCB      0
|L13.84|
        DCB      "low_threshold < 0xFFFFU",0

        AREA ||i.TSI_SetNumberOfScans||, CODE, READONLY, ALIGN=2

TSI_SetNumberOfScans PROC
        LDR      r2,[r0,#0]
        LDR      r3,|L14.20|
        ANDS     r2,r2,r3
        MOV      r3,#0x1f00
        AND      r3,r3,r1,LSL #8
        ORRS     r2,r2,r3
        STR      r2,[r0,#0]
        BX       lr
        ENDP

|L14.20|
        DCD      0x7fffe0fb

        AREA ||i.TSI_SetOscVoltageRails||, CODE, READONLY, ALIGN=2

TSI_SetOscVoltageRails PROC
        LDR      r2,[r0,#0]
        LDR      r3,|L15.20|
        ANDS     r2,r2,r3
        MOV      r3,#0x180000
        AND      r3,r3,r1,LSL #19
        ORRS     r2,r2,r3
        STR      r2,[r0,#0]
        BX       lr
        ENDP

|L15.20|
        DCD      0x7fe7fffb

        AREA ||i.TSI_SetReferenceChargeCurrent||, CODE, READONLY, ALIGN=2

TSI_SetReferenceChargeCurrent PROC
        LDR      r2,[r0,#0]
        LDR      r3,|L16.20|
        ANDS     r2,r2,r3
        MOV      r3,#0xe00000
        AND      r3,r3,r1,LSL #21
        ORRS     r2,r2,r3
        STR      r2,[r0,#0]
        BX       lr
        ENDP

|L16.20|
        DCD      0x7f1ffffb

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "..\\..\\devices\\MK66F18\\drivers\\fsl_tsi_v4.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___12_fsl_tsi_v4_c_TSI_Init____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___12_fsl_tsi_v4_c_TSI_Init____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___12_fsl_tsi_v4_c_TSI_Init____REVSH|
#line 483
|__asm___12_fsl_tsi_v4_c_TSI_Init____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___12_fsl_tsi_v4_c_TSI_Init____RRX|
#line 670
|__asm___12_fsl_tsi_v4_c_TSI_Init____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT TSI_Calibrate [CODE]
        EXPORT TSI_ClearStatusFlags [CODE]
        EXPORT TSI_Deinit [CODE]
        EXPORT TSI_DisableInterrupts [CODE]
        EXPORT TSI_EnableInterrupts [CODE]
        EXPORT TSI_GetLowPowerModeDefaultConfig [CODE]
        EXPORT TSI_GetNormalModeDefaultConfig [CODE]
        EXPORT TSI_Init [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT __aeabi_assert [CODE]

        KEEP TSI_EnableModule
        KEEP TSI_SetAnalogMode
        KEEP TSI_SetElectrodeOSCPrescaler
        KEEP TSI_SetHighThreshold
        KEEP TSI_SetLowThreshold
        KEEP TSI_SetNumberOfScans
        KEEP TSI_SetOscVoltageRails
        KEEP TSI_SetReferenceChargeCurrent

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