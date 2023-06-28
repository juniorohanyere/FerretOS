;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector [stage 2]		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]

; code segment
section .text
	global _start2

_start2:
	call clear

	mov al, [head3 + 1]	; something isn't right here
				; doesn't print, why?
	mov ah, 0x0e
	int 0x10
	call printc

	jmp start2

	jmp $

head3: db "How", 0
; subroutine
%include "stage2/bootsector.inc"

times 512 db 0
dw 0x0000
