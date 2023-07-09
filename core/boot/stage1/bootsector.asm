[org 0x7c00]

[bits 16]

section .text
	global _start

_start:
	jmp start

	mov ah, 0x0e
	mov al, 'P'
	int 0x10

	jmp $

; subroutine
%include "bootsector.inc"

; padding and magic number
times 510 - ($ - $$) db 0
dw 0xaa55
;times 256 dw 0xdada
;times 256 dw 0xface
