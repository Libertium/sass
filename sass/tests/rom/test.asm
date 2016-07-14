
	.bios

;
; COMPILING DIRECTIVES for ROM
;---------------------------------------------------------------------------

 	.page 1 
  	.rom 
	.start  initmain 

initmain: 
  ret 

;
; COMPILING DIRECTIVES for MEGAROM
;---------------------------------------------------------------------------

/*
  	.MEGAROM	KonamiSCC
	.START 		INITROM
	.ds	12

ROM_SIZE_MAX	.equ	16*8192

INITROM:
ROMADDR_INI:      
ROMCODE_ADDR_INI:	
SUBPAGE_00_ADDR_INI:	

SUBPAGE_00_MAINCODE_INI:
	di
	im 		1
	jp		initrom
*/