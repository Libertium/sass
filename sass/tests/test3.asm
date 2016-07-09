.org 0
    nop
    nop
    ld bc, windowTitle - helloString - 1
    ret
.echo $
.fill 1024-$, 0xfe
.ds 0x2000-$, 0xEE

.ds 08000h-$,0EEh

helloString:
    .db "Hello, world! As you can see it's a very long string, so it's fortunate that we have wrapping routines.\nPress [MODE] to exit.", 0
.echo helloString
windowTitle:
    .db "Hello, world!", 0
.echo windowTitle
.echo $
