; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\testmode2.o --depend=.\objects\testmode2.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\testmode2.crf ..\..\TestingFiles\TestMode2.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.AutoTestMode2||, CODE, READONLY, ALIGN=2

AutoTestMode2 PROC
        PUSH     {r4,lr}
        VPUSH    {d8-d9}
        SUB      sp,sp,#0x800
        MOV      r1,#0x400
        ADD      r0,sp,#0x400
        BL       __aeabi_memclr4
        MOV      r1,#0x200
        ADD      r0,sp,#0x200
        BL       __aeabi_memclr4
        MOV      r1,#0x200
        MOV      r0,sp
        BL       __aeabi_memclr4
        MOVS     r0,#0xfa
        VMOV     s17,r0
        VLDR     s0,|L1.248|
        VMOV.F32 s16,s0
        VLDR     s0,|L1.248|
        VMOV.F32 s18,s0
        MOVS     r4,#0
        MOVS     r0,#2
        BL       SetRunMode
        NOP      
|L1.74|
        MOVS     r0,#3
        BL       ChnlEnable
        BL       SendStartConv
        ADD      r1,sp,#0x400
        MOVS     r0,#0x86
        BL       ReadBurst16
        MOVS     r0,#0
        B        |L1.122|
|L1.98|
        ADD      r1,sp,#0x400
        LDRH     r1,[r1,r0,LSL #1]
        CBNZ     r1,|L1.120|
        VMOV.F32 s0,#1.00000000
        VADD.F32 s0,s16,s0
        VMOV.F32 s16,s0
|L1.120|
        ADDS     r0,r0,#1
|L1.122|
        LDR      r1,|L1.252|
        LDRH     r1,[r1,#0xe]  ; spiI2Props
        CMP      r1,r0
        BGT      |L1.98|
        VCVT.F32.S32 s0,s17
        VMOV.F32 s1,#2.00000000
        VMUL.F32 s0,s0,s1
        VDIV.F32 s1,s16,s0
        VLDR     s0,|L1.256|
        VMUL.F32 s0,s1,s0
        VMOV.F32 s16,s0
        VMOV.F32 s0,#30.00000000
        VCMPE.F32 s16,s0
        VMRS     APSR_nzcv,FPSCR
        BLE      |L1.174|
        MOVS     r4,#1
|L1.174|
        LDR      r0,|L1.252|
        LDRB     r0,[r0,#0]  ; spiI2Props
        CMP      r0,#8
        BNE      |L1.214|
        MOVS     r0,#0x10
        BL       FrameSizeSet
        MOV      r0,#0x5dc
        BL       SetConvRate
        MOVS     r1,#7
        MOVS     r0,#1
        BL       SetBurst
        VLDR     s0,|L1.248|
        VMOV.F32 s16,s0
        B        |L1.74|
|L1.214|
        MOVS     r0,#8
        BL       FrameSizeSet
        MOVS     r1,#0
        MOVS     r0,#1
        BL       SetBurst
        LDR      r0,|L1.260|
        BL       SetConvRate
        EOR      r0,r4,#1
        ADD      sp,sp,#0x800
        VPOP     {d8-d9}
        POP      {r4,pc}
        ENDP

|L1.248|
        DCFS     0x00000000 ; 0
|L1.252|
        DCD      spiI2Props
|L1.256|
        DCFS     0x42c80000 ; 100
|L1.260|
        DCD      0x0007a120

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "..\\..\\TestingFiles\\TestMode2.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___11_TestMode2_c_1bb26b33____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___11_TestMode2_c_1bb26b33____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___11_TestMode2_c_1bb26b33____REVSH|
#line 483
|__asm___11_TestMode2_c_1bb26b33____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___11_TestMode2_c_1bb26b33____RRX|
#line 670
|__asm___11_TestMode2_c_1bb26b33____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT AutoTestMode2 [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT __aeabi_memclr4 [CODE]
        IMPORT SetRunMode [CODE]
        IMPORT ChnlEnable [CODE]
        IMPORT SendStartConv [CODE]
        IMPORT ReadBurst16 [CODE]
        IMPORT FrameSizeSet [CODE]
        IMPORT SetConvRate [CODE]
        IMPORT SetBurst [CODE]
        IMPORT spiI2Props [DATA]

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
