/*

;Local Labels
; sass allows you to define local labels, which allows you to reuse common label names, such as "loop". You may preface any label name with "." to declare it as local, and it will be local within the prior global label. Example:

global1:
    ld a, b
.local:
    call .local
global2:
    ld b, a
.local:
    call .local ; Does not cause a Duplicate Name error

global3:
    ld b, a
@@local:
    call @@local ; Does not cause a Duplicate Name error

  	db $7F		;[Instrument] 16
	db $AA, $9E; volume slide
	db $C0		;[Wait] 1

	db $B4, $03; volume slide rep
	db $C2		;[Wait] 3
	db $0C		;[Note] 13
	db $69		;[Volume] 9
	db $AA, $9E; volume slide
	db $C0		;[Wait] 1
	db $B4, $04; volume slide rep
*/

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
		
;; set pages and subslot
;;
	call    0x138
	rrca
	rrca
	and     0x03
	ld      c,a
	ld      b,0
	ld      hl,0xfcc1
	add     hl,bc
	or      [hl]
	ld      b,a
	inc     hl
	inc     hl
	inc     hl
	inc     hl
	ld      a,[hl]
	and     0x0c
	or      b
    
	ld      h,0x80
	call    0x24        
	
	;clear RAM [first kb only]
	ld	bc,1024
	ld	hl,0xc000
	ld	de,0xc001

	ld	[hl],0
	ldir	

	;--- place replayer on hook
	ld	a,0xc3
	ld	hl,isr
	ld	[0xFD9A],a
	ld	[0xFD9B],hl	
	
	;--- initialise replayer
	call	replay_init
	
	;--- initialise demo song
	ld	hl,demo_song
	call	replay_loadsong
	
	ei
	
	xor	a
	ld	[pattern],a

	
infinite:
	halt
	;---- Test for space
	xor	a
	call	$00D8
	and	a
	jp	z,infinite

;	ld	a,0
;	call	replay_set_SCC_balance
;	ld	de,-2
;	call	replay_transpose	
	ld	a,32
	call	replay_fade_out
;	call	replay_pause
	; wait_key_release
@@loop:	
	xor	a
	call	$00D8
	and	a
	jp	nz,@@loop
	
	jp	infinite

	
	
isr:
	in	a,[0x99]
	call	replay_route		; first outout data
	call	replay_play			; calculate next output
	ret
	
	.INCLUDE	"ttreplay_asMSX.asm"
	.INCLUDE	"ttreplayDAT_asMSX.asm"

; Cesc per fer que generi un rom de 32KB	
;	.PAGE 2
demo_song:
	.INCLUDE	"demosong_asMSX.asm"

;	map	0xc000
	.PAGE 3
	
	.INCLUDE	"ttreplayRAM_asMSX.asm"
pattern:	.ds 1

