
	.db		-1-15		;err

	.db		+2+15		;err

	.db		-16			;Ok
	.db		-1+-15		;ok
	.db		-1			;Ok

	.db 	6*8-1-15	;err

	.db 	6*8-1-15, 26*8-3
	.db 	(6*8) -1 -15, 26*8-3


    xor b
    xor a, b
    add a, 10
    sub a, 20
foo:
    sub 20
    ld hl, 0x1234

    .print  2+3
    .print  +2-3
    .print -1