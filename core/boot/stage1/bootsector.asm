;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[org 0x7c00]	; segment address

[bits 16]

; code segment
section .text

	global _start

;;
 ; _start - entry point
;;

_start:
	jmp start

	jmp $

; subroutines
%include "stage1/bootsector.inc"

; padding: fill remaining spaces with 0
; 510 zeros minus size of previous codes
times 510 - ($-$$) db 0

; magic number
dw 0xaa55

; subroutines for stage2

%include "stage2/bootsector.asm"

