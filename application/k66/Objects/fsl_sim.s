; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\fsl_sim.o --depend=.\objects\fsl_sim.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\fsl_sim.crf ..\..\devices\MK66F18\drivers\fsl_sim.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.SIM_GetUniqueId||, CODE, READONLY, ALIGN=2

SIM_GetUniqueId PROC
        LDR      r1,|L1.20|
        LDR      r1,[r1,#0x58]
        STR      r1,[r0,#0]
        LDR      r1,|L1.20|
        LDR      r1,[r1,#0x5c]
        STR      r1,[r0,#4]
        LDR      r1,|L1.20|
        LDR      r1,[r1,#0x60]
        STR      r1,[r0,#8]
        BX       lr
        ENDP

|L1.20|
        DCD      0x40048000

        AREA ||i.SIM_SetUsbVoltRegulatorEnableMode||, CODE, READONLY, ALIGN=2

SIM_SetUsbVoltRegulatorEnableMode PROC
        LDR      r1,|L2.28|
        LDR      r1,[r1,#4]
        ORR      r1,r1,#0x7000000
        LDR      r2,|L2.28|
        STR      r1,[r2,#4]
        MOV      r1,r2
        LDR      r1,[r1,#0]
        BIC      r1,r1,#0xe0000000
        ORRS     r1,r1,r0
        STR      r1,[r2,#0]
        BX       lr
        ENDP

        DCW      0x0000
|L2.28|
        DCD      0x40047000

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "..\\..\\devices\\MK66F18\\drivers\\fsl_sim.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___9_fsl_sim_c_33eb8b83____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___9_fsl_sim_c_33eb8b83____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___9_fsl_sim_c_33eb8b83____REVSH|
#line 483
|__asm___9_fsl_sim_c_33eb8b83____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___9_fsl_sim_c_33eb8b83____RRX|
#line 670
|__asm___9_fsl_sim_c_33eb8b83____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT SIM_GetUniqueId [CODE]
        EXPORT SIM_SetUsbVoltRegulatorEnableMode [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]

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