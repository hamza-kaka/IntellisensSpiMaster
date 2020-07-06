; generated by Component: ARM Compiler 5.06 update 6 (build 750) Tool: ArmCC [4d3637]
; commandline ArmCC [--c99 --split_sections --debug -c --asm --gnu -o.\objects\fsl_ftfx_cache.o --depend=.\objects\fsl_ftfx_cache.d --cpu=Cortex-M4.fp --apcs=interwork -O0 --diag_suppress=9931 -I.\board -I..\..\CMSIS\Include -I..\..\devices\MK66F18 -I..\..\devices\MK66F18\drivers -I..\..\devices\MK66F18\arm -I..\..\devices\MK66F18\utilities -I..\..\devices\MK66F18\utilities\str -I..\..\devices\MK66F18\utilities\debug_console -I..\..\TestingFiles -I..\..\SpiCommunication -I..\..\I2Commands -I..\..\HelpingModules -I..\k66 -I..\..\components\serial_manager -I..\..\spiApp -I..\..\application -I.\RTE\_Target_1 -I"C:\Users\Taraz Tech1\AppData\Local\Arm\Packs\Keil\Kinetis_K60_DFP\1.5.0\Device\Include" -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=528 -DMK66FN2M0xxx18 -DCPU_MK66FN2M0VLQ18 --omf_browse=.\objects\fsl_ftfx_cache.crf ..\..\devices\MK66F18\drivers\fsl_ftfx_cache.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.FTFx_CACHE_ClearCachePrefetchSpeculation||, CODE, READONLY, ALIGN=1

FTFx_CACHE_ClearCachePrefetchSpeculation PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r0
        MOV      r4,r1
        CBNZ     r4,|L1.20|
        MOV      r0,r5
        BL       fmc_flash_cache_clear
        MOV      r0,r5
        BL       fmc_flash_prefetch_speculation_clear
|L1.20|
        MOVS     r0,#0
        POP      {r4-r6,pc}
        ENDP


        AREA ||i.FTFx_CACHE_Init||, CODE, READONLY, ALIGN=2

FTFx_CACHE_Init PROC
        PUSH     {r4,lr}
        MOV      r4,r0
        CBNZ     r4,|L2.10|
        MOVS     r0,#4
|L2.8|
        POP      {r4,pc}
|L2.10|
        LDR      r0,[r4,#4]
        CBNZ     r0,|L2.18|
        LDR      r0,|L2.28|
        STR      r0,[r4,#4]
|L2.18|
        LDR      r0,[r4,#4]
        BL       ftfx_copy_common_bit_operation_to_ram
        MOVS     r0,#0
        B        |L2.8|
        ENDP

|L2.28|
        DCD      s_ftfxCommonBitOperation

        AREA ||i.FTFx_CACHE_PflashGetPrefetchSpeculation||, CODE, READONLY, ALIGN=2

FTFx_CACHE_PflashGetPrefetchSpeculation PROC
        MOV      r1,r0
        MOVS     r0,#0
        STRH     r0,[r1,#0]
        STRB     r0,[r1,#0]
        STRB     r0,[r1,#1]
        LDR      r2,|L3.40|
        LDR      r0,[r2,#4]
        AND      r2,r0,#4
        CBNZ     r2,|L3.24|
        MOVS     r2,#1
        STRB     r2,[r1,#1]
|L3.24|
        AND      r2,r0,#2
        CBNZ     r2,|L3.34|
        MOVS     r2,#1
        STRB     r2,[r1,#0]
|L3.34|
        MOVS     r0,#0
        BX       lr
        ENDP

        DCW      0x0000
|L3.40|
        DCD      0x4001f000

        AREA ||i.FTFx_CACHE_PflashSetPrefetchSpeculation||, CODE, READONLY, ALIGN=2

FTFx_CACHE_PflashSetPrefetchSpeculation PROC
        MOV      r1,r0
        LDRB     r0,[r1,#0]
        CBNZ     r0,|L4.20|
        LDR      r0,|L4.80|
        LDR      r0,[r0,#4]
        ORR      r0,r0,#2
        LDR      r2,|L4.80|
        STR      r0,[r2,#4]
        B        |L4.32|
|L4.20|
        LDR      r0,|L4.80|
        LDR      r0,[r0,#4]
        BIC      r0,r0,#2
        LDR      r2,|L4.80|
        STR      r0,[r2,#4]
|L4.32|
        LDRB     r0,[r1,#1]
        CBNZ     r0,|L4.50|
        LDR      r0,|L4.80|
        LDR      r0,[r0,#4]
        ORR      r0,r0,#4
        LDR      r2,|L4.80|
        STR      r0,[r2,#4]
        B        |L4.62|
|L4.50|
        LDR      r0,|L4.80|
        LDR      r0,[r0,#4]
        BIC      r0,r0,#4
        LDR      r2,|L4.80|
        STR      r0,[r2,#4]
|L4.62|
        LDR      r0,|L4.80|
        LDR      r0,[r0,#4]
        ORR      r0,r0,#0x80000
        LDR      r2,|L4.80|
        STR      r0,[r2,#4]
        MOVS     r0,#0
        BX       lr
        ENDP

        DCW      0x0000
|L4.80|
        DCD      0x4001f000

        AREA ||i.fmc_flash_cache_clear||, CODE, READONLY, ALIGN=2

fmc_flash_cache_clear PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        LDR      r0,[r4,#4]
        ADDS     r5,r0,#1
        MOVS     r3,#0xf
        MOVS     r2,#0x14
        LSLS     r1,r3,#20
        LDR      r0,|L5.20|
        BLX      r5
        POP      {r4-r6,pc}
        ENDP

|L5.20|
        DCD      0x4001f004

        AREA ||i.fmc_flash_prefetch_speculation_clear||, CODE, READONLY, ALIGN=2

fmc_flash_prefetch_speculation_clear PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        LDR      r0,[r4,#4]
        ADDS     r5,r0,#1
        MOVS     r3,#1
        MOVS     r2,#0x13
        LSLS     r1,r3,#19
        LDR      r0,|L6.20|
        BLX      r5
        POP      {r4-r6,pc}
        ENDP

|L6.20|
        DCD      0x4001f004

        AREA ||i.ftfx_copy_common_bit_operation_to_ram||, CODE, READONLY, ALIGN=2

ftfx_copy_common_bit_operation_to_ram PROC
        PUSH     {r4,lr}
        MOV      r4,r0
        MOVS     r2,#0x1c
        LDR      r1,|L7.16|
        MOV      r0,r4
        BL       __aeabi_memcpy4
        POP      {r4,pc}
        ENDP

|L7.16|
        DCD      s_ftfxCommonBitOperationFunctionCode

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||.bss||, DATA, NOINIT, ALIGN=2

s_ftfxCommonBitOperation
        %        64

        AREA ||.constdata||, DATA, READONLY, ALIGN=1

s_ftfxCommonBitOperationFunctionCode
        DCW      0xb510,0x2900
        DCW      0xd005,0x6804
        DCW      0x438c,0x4093
        DCW      0x4019,0x4321
        DCW      0x6001,0xf3bf
        DCW      0x8f6f,0xf3bf
        DCW      0x8f4f,0xbd10

;*** Start embedded assembler ***

#line 1 "..\\..\\devices\\MK66F18\\drivers\\fsl_ftfx_cache.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___16_fsl_ftfx_cache_c_1b5b7a14____REV16|
#line 468 "..\\..\\CMSIS\\Include\\cmsis_armcc.h"
|__asm___16_fsl_ftfx_cache_c_1b5b7a14____REV16| PROC
#line 469

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___16_fsl_ftfx_cache_c_1b5b7a14____REVSH|
#line 483
|__asm___16_fsl_ftfx_cache_c_1b5b7a14____REVSH| PROC
#line 484

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___16_fsl_ftfx_cache_c_1b5b7a14____RRX|
#line 670
|__asm___16_fsl_ftfx_cache_c_1b5b7a14____RRX| PROC
#line 671

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT FTFx_CACHE_ClearCachePrefetchSpeculation [CODE]
        EXPORT FTFx_CACHE_Init [CODE]
        EXPORT FTFx_CACHE_PflashGetPrefetchSpeculation [CODE]
        EXPORT FTFx_CACHE_PflashSetPrefetchSpeculation [CODE]
        EXPORT fmc_flash_cache_clear [CODE]
        EXPORT fmc_flash_prefetch_speculation_clear [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT __aeabi_memcpy4 [CODE]

        KEEP ftfx_copy_common_bit_operation_to_ram
        KEEP s_ftfxCommonBitOperation
        KEEP s_ftfxCommonBitOperationFunctionCode

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
