;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]	; using 16-bits mode

; code section
section .text

	%include "bootsector.inc"

;;
 ; _start - entry point
;;

_start:
;	jmp _clear	; label from bootloader.asm

; subroutines
%include "bootloader.asm"
%include "bootloader.inc"

; padding: fill remaining spaces with 0(510 zeros minus size of previous codes)
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
