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

	ld	hl,0
	ld	[_SP_Storage],sp
	ld	sp,ix
	pop	af
	pop	af
	call replay_trigger

;	map	0xc000
;	.PAGE 3
	.org 0xc000
	
_SP_Storage:		.ds 2			; to store the SP

replay_trigger:		.ds 1			; trigger byte.
replay_mainPSGvol:	.ds 2			; volume mixer for PSG SCC balance
replay_mainSCCvol:	.ds 2			; volume mixer for PSG SCC balance
;replay_songbase:		.ds 2			; pointer to song data
replay_wavebase:		.ds 2			; pointer to waveform data
replay_insbase:		.ds 2			; pointer to instrument data
replay_orderpointer:	.ds 2			; pointer to the order track list pointers

pattern:	.ds 1
