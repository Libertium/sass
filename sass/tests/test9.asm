	.rom 

	.start init
	;db "MegaROM",1ah
    .org 04000h
    .db "AB"             ; ID bytes
    .dw init           	; cartridge initialization
    .dw 0                ; statement handler (not used)
    .dw 0                ; device handler (not used)
    .dw 0                ; BASIC program in ROM (not used, especially not in page 1)
    .dw 0,0,0            ; reserved

init:

	ei
	halt
	di
		
pattern2:	.ds 1    
	ret	
oldregs:	.ds (32*4)+(3*5)+1		

	ret	
	ret	
	ret	
	ret	

.INCBIN "tests\demosong.z80"  SKIP 32 SIZE 32 -16

/*
MUSIC_WDBOSS:
	.INCBIN 	"tests\demosong.z80"
.INCBIN "tests\demosong.z80"
	.INCBIN	"tests\demosong.z80"

	.INCBIN 	"tests\demosong.z80" SKIP 4096 SIZE 10494 - 8188

	.INCBIN 	"tests\demosong.z80" SIZE 8147 skip 0
	.INCBIN 	"tests\demosong.z80" SIZE 32-16
	.INCBIN 	"tests\demosong.z80" SIZE 32 - 16
	.INCBIN 	"tests\demosong.z80" SKIP 8188 SIZE 10494-8188
*/

/*
MUSIC_WDADVENTU:
	.INCBIN 	".\data\music\ADVENT.z80" SIZE 8188
	
SUBPAGE_10_ADDR_END:	
;SUBPAGE_10_CODESIZE 	.equ	SUBPAGE_10_ADDR_DATA-SUBPAGE_10_ADDR_INI
;SUBPAGE_10_DATASIZE 	.equ	SUBPAGE_10_ADDR_END-SUBPAGE_10_ADDR_DATA
;SUBPAGE_10_SIZE 		.equ	SUBPAGE_10_ADDR_END-SUBPAGE_10_ADDR_INI
;SUBPAGE_10_FREE			.equ	SUBPAGE_SIZE - SUBPAGE_10_SIZE
;---------------------------------------------------------------------------

	
;---------------------------------------------------------------------------
;.SUBPAGE 11 AT $6000
; SUBPAGE 11 CODE
;---------------------------------------------------------------------------
;SUBPAGE_11_ADDR_INI:	
;	.db "PG11"			; Com aquesta pagina es la continuacio de l'anterior aquest identificador molesta.

; SUBPAGE 11 DATA
;---------------------------------------------------------------------------
SUBPAGE_11_ADDR_DATA:
	.INCBIN 	".\data\music\ADVENT.z80" SKIP 8188 SIZE 10494-8188
*/



