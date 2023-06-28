;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector [stage 2]		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]

; code segment
section .text
	global _start2

_start2:
	mov al, 'H'
	call printc2
;	call printc

;	jmp start2	; jump to the start2 label of the stage2 bootloader

	jmp $

; subroutines
%include "stage2/print2.asm"
;%include "stage2/bootsector.inc"

; fill space (512) with 0 bytes
times 512 db 0

; word to fill space with
dw 0x0000
