;.include "./jslib/bios.asm"

CHKRAMB: .equ 0x0000
.equ CHKRAM  0x0000

.org 0
    nop
    nop
    ld bc, windowTitle - helloString - 1
    ret
.echo $
helloString:
    .db "Hello, world! As you can see it's a very long string, so it's fortunate that we have wrapping routines.\nPress [MODE] to exit.", 0
.echo helloString
windowTitle:
    .db "Hello, world!", 0
.echo windowTitle
.echo $

	ex		af,af'
	ex		af',af
    xor 	b
    xor	 	a, b
    add 	a, 10
    sub 	a, 20
foo:
    sub 	20
    ld 		hl, 0x1234
	call	CHKRAM
	
	xor		a

	.db		0xff
	db		0xfe	; de moment error
	
; INITIALIZATION
;---------------------------------------------------------------------------
INIT:

HACK:
	.REPT	0210
		nop
	.ENDR
.ORG HACK

	xor		a
;	ex	(hl),sp
;	ex	[hl],sp
EX [SP],HL
EX [SP],IX
EX [SP],IY


EX HL,[SP]
EX HL,[SP]


