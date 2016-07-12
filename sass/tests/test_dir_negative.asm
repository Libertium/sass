

	.PAGE 2
		ld		a,0
		ld	[TRACK_Chan1+17+TRACK_Instrument],a	
	.PAGE 3
		.INCLUDE	".\tests\trilo\ttreplayRAM.asm"