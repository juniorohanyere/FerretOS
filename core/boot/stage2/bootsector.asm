;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector [stage 2]		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x1000]
[bits 16]

; code segment
section .text
	global _start

_start:
	jmp start

	jmp $

; subroutine
%include "bootsector.inc"

times ((0x400) - ($ - $$)) db 0x00
