; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\system_mk66f18.o --depend=.\objects\system_mk66f18.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\system_mk66f18.crf ..\..\devices\MK66F18\system_MK66F18.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.SystemCoreClockUpdate||, CODE, READONLY, ALIGN=2

SystemCoreClockUpdate PROC
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0]
        AND      r2,r2,#0xc0
        CMP      r2,#0
        BNE      |L1.238|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#5]
        AND      r2,r2,#0x40
        CMP      r2,#0
        BNE      |L1.276|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0]
        AND      r2,r2,#4
        CMP      r2,#0
        BNE      |L1.162|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0xc]
        AND      r2,r2,#3
        CBZ      r2,|L1.56|
        CMP      r2,#1
        BEQ      |L1.60|
        CMP      r2,#2
        BNE      |L1.66|
        B        |L1.68|
|L1.56|
        LDR      r0,|L1.528|
        B        |L1.72|
|L1.60|
        MOV      r0,#0x8000
        B        |L1.72|
|L1.66|
        NOP      
|L1.68|
        LDR      r0,|L1.532|
        NOP      
|L1.72|
        NOP      
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#1]
        AND      r2,r2,#0x30
        CBZ      r2,|L1.142|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0xc]
        AND      r2,r2,#3
        CMP      r2,#1
        BEQ      |L1.142|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0]
        AND      r2,r2,#0x38
        CMP      r2,#0x30
        BEQ      |L1.118|
        CMP      r2,#0x38
        BNE      |L1.124|
        MOV      r1,#0x600
        B        |L1.140|
|L1.118|
        MOV      r1,#0x500
        B        |L1.140|
|L1.124|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0]
        UBFX     r3,r2,#3,#3
        MOVS     r2,#0x20
        LSLS     r2,r2,r3
        UXTH     r1,r2
        NOP      
|L1.140|
        B        |L1.156|
|L1.142|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0]
        UBFX     r3,r2,#3,#3
        MOVS     r2,#1
        LSLS     r2,r2,r3
        UXTH     r1,r2
|L1.156|
        UDIV     r0,r0,r1
        B        |L1.166|
|L1.162|
        MOV      r0,#0x8000
|L1.166|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#3]
        AND      r2,r2,#0xe0
        AND      r3,r2,#0x1f
        CBNZ     r3,|L1.266|
        ASRS     r2,r2,#5
        CMP      r2,#8
        BCS      |L1.266|
        TBB      [pc,r2]
        DCB      0x04,0x08
        DCB      0x0c,0x10,0x14,0x1a
        DCB      0x1e,0x22
        ADD      r2,r0,r0,LSL #2
        LSLS     r0,r2,#7
        B        |L1.274|
        ADD      r2,r0,r0,LSL #2
        LSLS     r0,r2,#8
        B        |L1.274|
        RSB      r2,r0,r0,LSL #4
        LSLS     r0,r2,#7
        B        |L1.274|
        ADD      r2,r0,r0,LSL #2
        LSLS     r0,r2,#9
        B        |L1.274|
        MOV      r2,#0x2dc
        MULS     r0,r2,r0
        B        |L1.274|
|L1.238|
        B        |L1.400|
        B        |L1.276|
        MOV      r2,#0x5b8
        MULS     r0,r2,r0
        B        |L1.274|
        MOV      r2,#0x895
        MULS     r0,r2,r0
        B        |L1.274|
        MOV      r2,#0xb71
        MULS     r0,r2,r0
        B        |L1.274|
|L1.266|
        ADD      r2,r0,r0,LSL #2
        LSLS     r0,r2,#7
        NOP      
|L1.274|
        B        |L1.502|
|L1.276|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0x10]
        AND      r2,r2,#0x10
        CBNZ     r2,|L1.320|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#4]
        AND      r2,r2,#7
        ADDS     r1,r2,#1
        LDR      r2,|L1.528|
        UDIV     r0,r2,r1
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#5]
        AND      r2,r2,#0x1f
        ADD      r1,r2,#0x10
        MULS     r0,r1,r0
        LSRS     r0,r0,#1
        B        |L1.502|
|L1.320|
        LDR      r2,|L1.536|
        LDR      r2,[r2,#0]
        AND      r2,r2,#0xc
        CBNZ     r2,|L1.334|
        LDR      r0,|L1.528|
        B        |L1.502|
|L1.334|
        LDR      r2,|L1.536|
        LDR      r2,[r2,#0]
        UBFX     r1,r2,#4,#6
        LDR      r2,|L1.540|
        LDR      r2,[r2,#0x100]
        AND      r2,r2,#0xc
        CMP      r2,#4
        BNE      |L1.366|
        MOV      r2,#0xffff
        AND      r1,r2,r1,LSL #2
        B        |L1.386|
|L1.366|
        LDR      r2,|L1.536|
        LDR      r2,[r2,#0]
        AND      r2,r2,#0xc
        CMP      r2,#8
        BNE      |L1.386|
        MOV      r2,#0xffff
        AND      r1,r2,r1,LSL #1
|L1.386|
        LDR      r2,|L1.544|
        SDIV     r0,r2,r1
        ADD      r2,r0,r0,LSL #3
        LSLS     r0,r2,#1
        B        |L1.502|
|L1.400|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0]
        AND      r2,r2,#0xc0
        CMP      r2,#0x40
        BNE      |L1.450|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#1]
        AND      r2,r2,#1
        CBNZ     r2,|L1.428|
        MOV      r0,#0x8000
        B        |L1.502|
|L1.428|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#8]
        UBFX     r3,r2,#1,#3
        MOVS     r2,#1
        LSLS     r2,r2,r3
        UXTH     r1,r2
        LDR      r2,|L1.548|
        UDIV     r0,r2,r1
        B        |L1.502|
|L1.450|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0]
        AND      r2,r2,#0xc0
        CMP      r2,#0x80
        BNE      |L1.500|
        LDR      r2,|L1.524|
        LDRB     r2,[r2,#0xc]
        AND      r2,r2,#3
        CBZ      r2,|L1.482|
        CMP      r2,#1
        BEQ      |L1.486|
        CMP      r2,#2
        BNE      |L1.492|
        B        |L1.494|
|L1.482|
        LDR      r0,|L1.528|
        B        |L1.498|
|L1.486|
        MOV      r0,#0x8000
        B        |L1.498|
|L1.492|
        NOP      
|L1.494|
        LDR      r0,|L1.532|
        NOP      
|L1.498|
        B        |L1.502|
|L1.500|
        BX       lr
|L1.502|
        LDR      r2,|L1.552|
        LDR      r2,[r2,#0x44]
        MOVS     r3,#1
        ADD      r2,r3,r2,LSR #28
        UDIV     r2,r0,r2
        LDR      r3,|L1.556|
        STR      r2,[r3,#0]  ; SystemCoreClock
        NOP      
        B        |L1.500|
        ENDP

|L1.524|
        DCD      0x40064000
|L1.528|
        DCD      0x00f42400
|L1.532|
        DCD      0x02dc6c00
|L1.536|
        DCD      0x400a2100
|L1.540|
        DCD      0x400a2000
|L1.544|
        DCD      0x1c9c3800
|L1.548|
        DCD      0x003d0900
|L1.552|
        DCD      0x40048000
|L1.556|
        DCD      SystemCoreClock

        AREA ||i.SystemInit||, CODE, READONLY, ALIGN=2

SystemInit PROC
        PUSH     {r4,lr}
        LDR      r0,|L2.40|
        LDR      r0,[r0,#0]
        ORR      r0,r0,#0xf00000
        LDR      r1,|L2.40|
        STR      r0,[r1,#0]
        MOV      r0,#0xc520
        LDR      r1,|L2.44|
        STRH     r0,[r1,#0xe]
        MOV      r0,#0xd928
        STRH     r0,[r1,#0xe]
        MOV      r0,#0x1d2
        STRH     r0,[r1,#0]
        BL       SystemInitHook
        POP      {r4,pc}
        ENDP

|L2.40|
        DCD      0xe000ed88
|L2.44|
        DCD      0x40052000

        AREA ||i.SystemInitHook||, CODE, READONLY, ALIGN=1

SystemInitHook PROC
        BX       lr
        ENDP


        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||.data||, DATA, ALIGN=2

SystemCoreClock
        DCD      0x01400000

;*** Start embedded assembler ***

#line 1 "..\\..\\devices\\MK66F18\\system_MK66F18.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___16_system_MK66F18_c_5d646a67____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___16_system_MK66F18_c_5d646a67____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___16_system_MK66F18_c_5d646a67____REVSH|
#line 483
|__asm___16_system_MK66F18_c_5d646a67____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___16_system_MK66F18_c_5d646a67____RRX|
#line 670
|__asm___16_system_MK66F18_c_5d646a67____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT SystemCoreClockUpdate [CODE]
        EXPORT SystemInit [CODE]
        EXPORT SystemInitHook [CODE,WEAK]
        EXPORT SystemCoreClock [DATA,SIZE=4]

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
