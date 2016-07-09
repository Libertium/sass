

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
