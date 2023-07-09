section .text
	global _start

[bits 16]
_start:
	jmp start

	jmp $

; subroutine

%include "bootsector.inc"
