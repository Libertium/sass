
;.verbose

.rom
.page 1
.start init
		

	.db -1
	.dw -257

TRACK_Instrument_CESC		.equ -17
	ld hl,TRACK_Instrument_CESC
initmain:

;	ex af,af'	;'
;	ex af,af'	;'


.org 0x4100
.printtext "Test org:"

init:
start:
.printtext "Test ds size 32 bytes"
.print $
.ds 32
.print $
ld	a,[start]
call	fun

.org 0x4200
fun:
ret
ret

.page 2
ret
nop
nop
ret

.org 0xc000
data:
.ds	10


