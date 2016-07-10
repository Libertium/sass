.rom
.page 1
﻿.start init
		

;.org 0x4000
.echo "Test org:"

init:
start:
.echo "Test ds size 32 bytes"
.echo $
.ds 32
.echo $
ld	a,[start]
call	fun

.org 0x4100
fun:
	ret

