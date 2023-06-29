;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector [stage 2]		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x8000]
[bits 16]

; code segment
section .text
	global _start

_start:
	jmp start

	jmp $

; subroutine
%include "bootsector.inc"

times 512 db 0
dw 0xface
;times ((0x400) - ($ - $$)) db 0x00
