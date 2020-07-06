; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\fsl_flexbus.o --depend=.\objects\fsl_flexbus.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\fsl_flexbus.crf ..\..\devices\MK66F18\drivers\fsl_flexbus.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.FLEXBUS_Deinit||, CODE, READONLY, ALIGN=2

FLEXBUS_Deinit PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r0
        MOV      r0,r5
        BL       FLEXBUS_GetInstance
        LDR      r1,|L1.36|
        LDR      r4,[r1,r0,LSL #2]
        LDR      r1,|L1.40|
        ADD      r0,r1,r4,LSR #16
        LDR      r1,[r0,#0]
        MOVS     r2,#1
        LSLS     r2,r2,r4
        BICS     r1,r1,r2
        STR      r1,[r0,#0]
        NOP      
        POP      {r4-r6,pc}
        ENDP

|L1.36|
        DCD      s_flexbusClocks
|L1.40|
        DCD      0x40047000

        AREA ||i.FLEXBUS_GetDefaultConfig||, CODE, READONLY, ALIGN=1

FLEXBUS_GetDefaultConfig PROC
        PUSH     {r4,lr}
        MOV      r4,r0
        MOVS     r1,#0x20
        MOV      r0,r4
        BL       __aeabi_memclr4
        MOVS     r0,#0
        STRB     r0,[r4,#0]
        STRB     r0,[r4,#0xc]
        STRB     r0,[r4,#0xd]
        STRB     r0,[r4,#0xe]
        STRB     r0,[r4,#0xf]
        MOVS     r0,#1
        STRB     r0,[r4,#0x10]
        MOVS     r0,#0
        STRB     r0,[r4,#0x11]
        STRB     r0,[r4,#0x12]
        STRB     r0,[r4,#0x14]
        STRB     r0,[r4,#0x15]
        STRB     r0,[r4,#0x16]
        STRB     r0,[r4,#0x17]
        MOVS     r0,#1
        STRB     r0,[r4,#0x13]
        MOVS     r0,#0
        STRB     r0,[r4,#0x18]
        STRB     r0,[r4,#0x19]
        STRB     r0,[r4,#0x1a]
        STRB     r0,[r4,#0x1b]
        STRB     r0,[r4,#0x1c]
        POP      {r4,pc}
        ENDP


        AREA ||i.FLEXBUS_GetInstance||, CODE, READONLY, ALIGN=2

FLEXBUS_GetInstance PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r0
        MOVS     r4,#0
        B        |L3.22|
|L3.8|
        LDR      r0,|L3.48|
        LDR      r0,[r0,r4,LSL #2]
        CMP      r0,r5
        BNE      |L3.20|
        B        |L3.26|
|L3.20|
        ADDS     r4,r4,#1
|L3.22|
        CMP      r4,#0
        BEQ      |L3.8|
|L3.26|
        NOP      
        CBNZ     r4,|L3.32|
        B        |L3.42|
|L3.32|
        MOVS     r2,#0x3a
        ADR      r1,|L3.52|
        ADR      r0,|L3.96|
        BL       __aeabi_assert
|L3.42|
        MOV      r0,r4
        POP      {r4-r6,pc}
        ENDP

        DCW      0x0000
|L3.48|
        DCD      s_flexbusBases
|L3.52|
        DCB      "..\\..\\devices\\MK66F18\\drivers\\fsl_flexbus.c",0
|L3.96|
        DCB      "instance < ARRAY_SIZE(s_flexbusBases)",0
        DCB      0
        DCB      0

        AREA ||i.FLEXBUS_Init||, CODE, READONLY, ALIGN=2

FLEXBUS_Init PROC
        PUSH     {r4-r8,lr}
        MOV      r6,r0
        MOV      r5,r1
        CBZ      r5,|L4.12|
        B        |L4.22|
|L4.12|
        MOVS     r2,#0x57
        ADR      r1,|L4.332|
        ADR      r0,|L4.376|
        BL       __aeabi_assert
|L4.22|
        LDRB     r0,[r5,#0]
        CMP      r0,#6
        BCS      |L4.30|
        B        |L4.40|
|L4.30|
        MOVS     r2,#0x58
        ADR      r1,|L4.332|
        ADR      r0,|L4.392|
        BL       __aeabi_assert
|L4.40|
        LDRB     r0,[r5,#1]
        CMP      r0,#0x3f
        BHI      |L4.48|
        B        |L4.58|
|L4.48|
        MOVS     r2,#0x59
        ADR      r1,|L4.332|
        ADR      r0,|L4.424|
        BL       __aeabi_assert
|L4.58|
        LDRB     r0,[r5,#2]
        CMP      r0,#0x3f
        BHI      |L4.66|
        B        |L4.76|
|L4.66|
        MOVS     r2,#0x5a
        ADR      r1,|L4.332|
        ADR      r0,|L4.452|
        BL       __aeabi_assert
|L4.76|
        LDRB     r7,[r5,#0]
        MOVS     r4,#0
        MOV      r0,r6
        BL       FLEXBUS_GetInstance
        LDR      r1,|L4.492|
        LDR      r8,[r1,r0,LSL #2]
        LDR      r1,|L4.496|
        ADD      r0,r1,r8,LSR #16
        LDR      r1,[r0,#0]
        MOVS     r2,#1
        LSL      r2,r2,r8
        ORRS     r1,r1,r2
        STR      r1,[r0,#0]
        NOP      
        MOVS     r0,#0
        ADD      r1,r7,r7,LSL #1
        ADD      r1,r6,r1,LSL #2
        STR      r0,[r1,#4]
        ADD      r0,r7,r7,LSL #1
        LDR      r0,[r6,r0,LSL #2]
        UXTH     r0,r0
        ADD      r1,r7,r7,LSL #1
        STR      r0,[r6,r1,LSL #2]
        MOVS     r0,#0
        ADD      r1,r7,r7,LSL #1
        ADD      r1,r6,r1,LSL #2
        STR      r0,[r1,#8]
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        STR      r4,[r6,#0x60]
        LDR      r4,[r5,#4]
        ADD      r0,r7,r7,LSL #1
        STR      r4,[r6,r0,LSL #2]
        MOVS     r4,#1
        LDRB     r0,[r5,#0xc]
        ORR      r4,r4,r0,LSL #8
        LDRH     r0,[r5,#8]
        ORR      r4,r4,r0,LSL #16
        ADD      r0,r7,r7,LSL #1
        ADD      r0,r6,r0,LSL #2
        STR      r4,[r0,#4]
        LDRB     r0,[r5,#0xd]
        LSLS     r4,r0,#3
        LDRB     r0,[r5,#0xe]
        ORR      r4,r4,r0,LSL #4
        LDRB     r0,[r5,#0xf]
        ORR      r4,r4,r0,LSL #5
        LDRB     r0,[r5,#0x13]
        ORR      r4,r4,r0,LSL #6
        LDRB     r0,[r5,#0x10]
        ORR      r4,r4,r0,LSL #8
        LDRB     r0,[r5,#0x14]
        ORR      r4,r4,r0,LSL #9
        LDRB     r0,[r5,#1]
        ORR      r4,r4,r0,LSL #10
        LDRB     r0,[r5,#0x15]
        ORR      r4,r4,r0,LSL #16
        LDRB     r0,[r5,#0x16]
        ORR      r4,r4,r0,LSL #18
        LDRB     r0,[r5,#0x17]
        ORR      r4,r4,r0,LSL #20
        LDRB     r0,[r5,#0x11]
        ORR      r4,r4,r0,LSL #22
        LDRB     r0,[r5,#0x12]
        CBZ      r0,|L4.278|
        ORR      r4,r4,#0x800000
        LDRB     r0,[r5,#2]
        ORR      r4,r4,r0,LSL #26
|L4.278|
        ADD      r0,r7,r7,LSL #1
        ADD      r0,r6,r0,LSL #2
        STR      r4,[r0,#8]
        LDRB     r0,[r5,#0x18]
        LSLS     r4,r0,#28
        LDRB     r0,[r5,#0x19]
        ORR      r4,r4,r0,LSL #24
        LDRB     r0,[r5,#0x1a]
        ORR      r4,r4,r0,LSL #20
        LDRB     r0,[r5,#0x1b]
        ORR      r4,r4,r0,LSL #16
        LDRB     r0,[r5,#0x1c]
        ORR      r4,r4,r0,LSL #12
        STR      r4,[r6,#0x60]
        CBZ      r7,|L4.328|
        LDR      r0,[r6,#4]
        ORR      r0,r0,#1
        STR      r0,[r6,#4]
|L4.328|
        POP      {r4-r8,pc}
        ENDP

|L4.332|
        DCB      "..\\..\\devices\\MK66F18\\drivers\\fsl_flexbus.c",0
|L4.376|
        DCB      "config != NULL",0
        DCB      0
|L4.392|
        DCB      "config->chip < FB_CSAR_COUNT",0
        DCB      0
        DCB      0
        DCB      0
|L4.424|
        DCB      "config->waitStates <= 0x3FU",0
|L4.452|
        DCB      "config->secondaryWaitStates <= 0x3FU",0
        DCB      0
        DCB      0
        DCB      0
|L4.492|
        DCD      s_flexbusClocks
|L4.496|
        DCD      0x40047000

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||.constdata||, DATA, READONLY, ALIGN=2

s_flexbusBases
        DCD      0x4000c000
s_flexbusClocks
        DCD      0x10400000

;*** Start embedded assembler ***

#line 1 "..\\..\\devices\\MK66F18\\drivers\\fsl_flexbus.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___13_fsl_flexbus_c_a4cec548____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___13_fsl_flexbus_c_a4cec548____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___13_fsl_flexbus_c_a4cec548____REVSH|
#line 483
|__asm___13_fsl_flexbus_c_a4cec548____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___13_fsl_flexbus_c_a4cec548____RRX|
#line 670
|__asm___13_fsl_flexbus_c_a4cec548____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT FLEXBUS_Deinit [CODE]
        EXPORT FLEXBUS_GetDefaultConfig [CODE]
        EXPORT FLEXBUS_Init [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT __aeabi_assert [CODE]
        IMPORT __aeabi_memclr4 [CODE]

        KEEP FLEXBUS_GetInstance
        KEEP s_flexbusBases
        KEEP s_flexbusClocks

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