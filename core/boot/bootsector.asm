;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[org 0x7c00]	; offset is bootsector code

[bits 16]

; code segment
section .text

	global _start

;;
 ; _start - entry point
;;

_start:
	jmp _clear	; first clear the screen

; subroutines
%include "bootsector.inc"

; padding: fill remaining spaces with 0
; 510 zeros minus size of previous codes
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
