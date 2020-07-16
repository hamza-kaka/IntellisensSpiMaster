; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\testmode4.o --depend=.\objects\testmode4.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\testmode4.crf ..\..\TestingFiles\TestMode4.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.AutoTestMode4||, CODE, READONLY, ALIGN=2

AutoTestMode4 PROC
        PUSH     {r4,r5,lr}
        VPUSH    {d8-d9}
        SUB      sp,sp,#0x60c
        MOV      r1,#0x200
        ADD      r0,sp,#0xc
        BL       __aeabi_memclr4
        MOVS     r5,#0x64
        VLDR     s0,|L1.564|
        VMOV.F32 s16,s0
        VLDR     s0,|L1.564|
        VMOV.F32 s19,s0
        VLDR     s0,|L1.564|
        VMOV.F32 s17,s0
        VLDR     s0,|L1.564|
        VMOV.F32 s18,s0
        VLDR     s0,|L1.564|
        VSTR     s0,[sp,#8]
        VLDR     s0,|L1.564|
        VSTR     s0,[sp,#4]
        MOVS     r4,#0
        MOVS     r0,#4
        BL       SetRunMode
        MOVS     r0,#0x10
        BL       FrameSizeSet
        NOP      
|L1.86|
        LDR      r0,|L1.568|
        LDRB     r0,[r0,#0]  ; spiI2Props
        CMP      r0,#0x10
        BNE      |L1.102|
        MOVS     r0,#1
        LDR      r1,|L1.572|
        STRB     r0,[r1,#0]
        B        |L1.108|
|L1.102|
        MOVS     r0,#0
        LDR      r1,|L1.572|
        STRB     r0,[r1,#0]
|L1.108|
        MOVS     r0,#3
        BL       ChnlEnable
        BL       SendStartConv
        LDR      r0,|L1.576|
        MOVS     r1,#0
        ADD      r2,r0,#0x100
        ADD      r2,r2,r1,LSL #4
        LDR      r2,[r2,#8]
        ORR      r3,r2,#1
        ADD      r2,r0,#0x100
        ADD      r2,r2,r1,LSL #4
        STR      r3,[r2,#8]
        NOP      
        B        |L1.174|
|L1.150|
        ADD      r1,sp,#0x20c
        MOVS     r0,#0x86
        BL       ReadBurst16
        VLDR     s0,[sp,#4]
        VMOV.F32 s1,#1.00000000
        VADD.F32 s0,s0,s1
        VSTR     s0,[sp,#4]
|L1.174|
        LDR      r0,|L1.576|
        MOVS     r1,#0
        ADD      r2,r0,#0x100
        ADD      r2,r2,r1,LSL #4
        LDR      r2,[r2,#0xc]
        AND      r2,r2,#1
        CMP      r2,#0
        BEQ      |L1.150|
        BL       SendStopConv
        LDR      r0,|L1.576|
        MOVS     r1,#0
        ADD      r2,r0,#0x100
        ADD      r2,r2,r1,LSL #4
        LDR      r2,[r2,#8]
        BIC      r3,r2,#1
        ADD      r2,r0,#0x100
        ADD      r2,r2,r1,LSL #4
        STR      r3,[r2,#8]
        NOP      
        MOVS     r2,#1
        ADD      r3,r0,#0x100
        ADD      r3,r3,r1,LSL #4
        STR      r2,[r3,#0xc]
        NOP      
        MOVS     r0,#2
        BL       CLOCK_GetFreq
        VMOV     s0,r0
        VCVT.F32.U32 s1,s0
        LDR      r0,|L1.580|
        LDR      r0,[r0,#0]
        VMOV     s0,r0
        VCVT.F32.U32 s0,s0
        VDIV.F32 s2,s0,s1
        VMOV.F32 s18,s2
        LDR      r0,|L1.568|
        LDRH     r0,[r0,#0xe]  ; spiI2Props
        VMOV     s0,r0
        VCVT.F32.U32 s0,s0
        VLDR     s1,[sp,#4]
        VMUL.F32 s1,s0,s1
        LDR      r0,|L1.568|
        VLDR     s0,[r0,#8]
        VCVT.F32.S32 s2,s0
        VDIV.F32 s0,s1,s2
        VDIV.F32 s1,s0,s18
        VSTR     s1,[sp,#8]
        VLDR     s1,[r0,#0x10]
        VCVT.F32.U32 s1,s1
        VLDR     s2,[sp,#8]
        VSUB.F32 s0,s2,s1
        VABS.F32 s1,s0
        VMOV.F32 s17,s1
        VLDR     s0,[r0,#0x10]
        VCVT.F32.U32 s0,s0
        VDIV.F32 s1,s17,s0
        VLDR     s0,|L1.584|
        VMUL.F32 s0,s1,s0
        VMOV.F32 s1,#5.00000000
        VCMPE.F32 s0,s1
        VMRS     APSR_nzcv,FPSCR
        BLE      |L1.410|
        LDRB     r0,[r0,#0]  ; spiI2Props
        CMP      r0,#0x10
        BNE      |L1.410|
        LDR      r0,|L1.568|
        VLDR     s0,[r0,#0x10]
        VCVT.F32.U32 s0,s0
        VLDR     s1,[sp,#8]
        VCMPE.F32 s0,s1
        VMRS     APSR_nzcv,FPSCR
        BLE      |L1.410|
        MOVS     r4,#1
|L1.410|
        MOVS     r0,#0
        B        |L1.436|
|L1.414|
        ADD      r1,sp,#0x20c
        LDRH     r1,[r1,r0,LSL #1]
        CBNZ     r1,|L1.434|
        VMOV.F32 s0,#1.00000000
        VADD.F32 s0,s16,s0
        VMOV.F32 s16,s0
|L1.434|
        ADDS     r0,r0,#1
|L1.436|
        LDR      r1,|L1.568|
        LDRH     r1,[r1,#0xe]  ; spiI2Props
        CMP      r1,r0
        BGT      |L1.414|
        LDR      r0,|L1.568|
        LDRH     r0,[r0,#0xe]  ; spiI2Props
        VMOV     s0,r0
        VCVT.F32.U32 s1,s0
        VDIV.F32 s0,s16,s1
        VLDR     s1,|L1.584|
        VMUL.F32 s0,s0,s1
        VMOV.F32 s16,s0
        VMOV.F32 s0,#30.00000000
        VCMPE.F32 s16,s0
        VMRS     APSR_nzcv,FPSCR
        BLE      |L1.488|
        MOVS     r4,#1
|L1.488|
        LDR      r0,|L1.568|
        LDRB     r0,[r0,#0]  ; spiI2Props
        CMP      r0,#0x10
        BNE      |L1.534|
        MOVS     r0,#8
        BL       FrameSizeSet
        MOV      r0,#0x5dc
        BL       SetConvRate
        MOVS     r1,#7
        MOVS     r0,#1
        BL       SetBurst
        VLDR     s0,|L1.564|
        VMOV.F32 s16,s0
        MOVS     r0,#0
        LDR      r1,|L1.572|
        STRB     r0,[r1,#0]
        B        |L1.86|
|L1.534|
        MOVS     r1,#0
        MOVS     r0,#1
        BL       SetBurst
        LDR      r0,|L1.588|
        BL       SetConvRate
        EOR      r0,r4,#1
        ADD      sp,sp,#0x60c
        VPOP     {d8-d9}
        POP      {r4,r5,pc}
        ENDP

        DCW      0x0000
|L1.564|
        DCFS     0x00000000 ; 0
|L1.568|
        DCD      spiI2Props
|L1.572|
        DCD      convRateTest
|L1.576|
        DCD      0x40037000
|L1.580|
        DCD      0x40037100
|L1.584|
        DCFS     0x42c80000 ; 100
|L1.588|
        DCD      0x0007a120

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "..\\..\\TestingFiles\\TestMode4.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___11_TestMode4_c_f2d1ce06____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___11_TestMode4_c_f2d1ce06____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___11_TestMode4_c_f2d1ce06____REVSH|
#line 483
|__asm___11_TestMode4_c_f2d1ce06____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___11_TestMode4_c_f2d1ce06____RRX|
#line 670
|__asm___11_TestMode4_c_f2d1ce06____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT AutoTestMode4 [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT __aeabi_memclr4 [CODE]
        IMPORT SetRunMode [CODE]
        IMPORT FrameSizeSet [CODE]
        IMPORT ChnlEnable [CODE]
        IMPORT SendStartConv [CODE]
        IMPORT ReadBurst16 [CODE]
        IMPORT SendStopConv [CODE]
        IMPORT CLOCK_GetFreq [CODE]
        IMPORT SetConvRate [CODE]
        IMPORT SetBurst [CODE]
        IMPORT spiI2Props [DATA]
        IMPORT convRateTest [DATA]

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
