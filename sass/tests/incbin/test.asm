.org 0x0000
.echo "Test incbin:"
.echo $
.ds 32
.echo "Test incbin size 32 bytes"
.echo $
.INCBIN 	"tests\incbin\demosong.z80" SIZE 32-16
.echo $
MUSIC_WDBOSS:
	.INCBIN 	"tests\incbin\demosong.z80"
.INCBIN "tests\demosong.z80"
	.INCBIN	"tests\demosong.z80"

	.INCBIN 	"tests\incbin\demosong.z80" SKIP 4096 SIZE 10494 - 8188

	.INCBIN 	"tests\incbin\demosong.z80" SIZE 8147 skip 0
	.INCBIN 	"tests\incbin\demosong.z80" SIZE 32-16
	.INCBIN 	"tests\incbin\demosong.z80" SIZE 32 - 16
	.INCBIN 	"tests\incbin\demosong.z80" SKIP 8188 SIZE 10494-8188
.echo $