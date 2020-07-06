; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\pin_mux.o --depend=.\objects\pin_mux.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\pin_mux.crf board\pin_mux.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.BOARD_InitBootPins||, CODE, READONLY, ALIGN=1

BOARD_InitBootPins PROC
        PUSH     {r4,lr}
        BL       BOARD_InitPins
        POP      {r4,pc}
        ENDP


        AREA ||i.BOARD_InitPins||, CODE, READONLY, ALIGN=2

BOARD_InitPins PROC
        PUSH     {r3,lr}
        LDR      r0,|L2.92|
        LDR      r2,|L2.96|
        ADD      r1,r2,r0,LSR #16
        LDR      r2,[r1,#0]
        MOVS     r3,#1
        LSLS     r3,r3,r0
        ORRS     r2,r2,r3
        STR      r2,[r1,#0]
        NOP      
        LDR      r0,|L2.100|
        LDR      r0,[r0,#0]  ; <Data1>
        STR      r0,[sp,#0]
        MOV      r2,sp
        MOVS     r1,#4
        LDR      r0,|L2.104|
        BL       GPIO_PinInit
        MOVS     r2,#2
        MOVS     r1,#0xb
        LDR      r0,|L2.108|
        BL       PORT_SetPinMux
        MOVS     r2,#2
        MOVS     r1,#0xc
        LDR      r0,|L2.108|
        BL       PORT_SetPinMux
        MOVS     r2,#2
        MOVS     r1,#0xd
        LDR      r0,|L2.108|
        BL       PORT_SetPinMux
        MOVS     r2,#2
        MOVS     r1,#0xe
        LDR      r0,|L2.108|
        BL       PORT_SetPinMux
        MOVS     r2,#1
        MOVS     r1,#4
        LDR      r0,|L2.108|
        BL       PORT_SetPinMux
        POP      {r3,pc}
        ENDP

        DCW      0x0000
|L2.92|
        DCD      0x1038000c
|L2.96|
        DCD      0x40047000
|L2.100|
        DCD      ||.constdata||
|L2.104|
        DCD      0x400ff0c0
|L2.108|
        DCD      0x4004c000

        AREA ||i.PORT_SetPinMux||, CODE, READONLY, ALIGN=1

PORT_SetPinMux PROC
        LDR      r3,[r0,r1,LSL #2]
        BFI      r3,r2,#8,#3
        STR      r3,[r0,r1,LSL #2]
        BX       lr
        ENDP


        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||.constdata||, DATA, READONLY, ALIGN=2

        DCB      0x01,0x00

;*** Start embedded assembler ***

#line 1 "board\\pin_mux.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___9_pin_mux_c_e17a3c6b____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___9_pin_mux_c_e17a3c6b____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___9_pin_mux_c_e17a3c6b____REVSH|
#line 483
|__asm___9_pin_mux_c_e17a3c6b____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___9_pin_mux_c_e17a3c6b____RRX|
#line 670
|__asm___9_pin_mux_c_e17a3c6b____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT BOARD_InitBootPins [CODE]
        EXPORT BOARD_InitPins [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT GPIO_PinInit [CODE]

        KEEP PORT_SetPinMux

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
