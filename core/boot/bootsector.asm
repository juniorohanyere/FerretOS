;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]	; 16 bits mode

; code section
section .text
	;global _start
	;extern tty
	%include "bootsector.inc"

	extern clear
_clear:
	call clear

; entry point
_start:
	mov ah, 0x0e	; tty, print characters
	mov si, string

	jmp printstring

%include "data.asm"
%include "screen.asm"
%include "stdio.asm"

; fill remaining spaces with 0
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
