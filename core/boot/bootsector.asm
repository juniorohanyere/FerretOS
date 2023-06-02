;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]	; 16 bits mode

; code section
section .text
	global _start
	extern tty

; entry point
_start:
	jmp tty

; fill remaining spaces with 0
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
