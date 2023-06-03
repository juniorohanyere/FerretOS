;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]	; 16 bits mode

; code section
section .text
	;global _start
	;extern tty
	%include "bootsector.inc"

; entry point
_start:
	call clear

	mov ah, 0x0e	; tty, print characters
	mov si, string

	jmp printstring

; fill remaining spaces with 0
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
