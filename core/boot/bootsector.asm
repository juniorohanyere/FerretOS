;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]	; using 16-bits mode

; code section
section .text
	%include "bootsector.inc"

;;
 ; _clear - calls the clear function in screen.asm
;;

_clear:
	call clear
;;
 ; _start - entry point
_start:
	mov ah, 0x0e	; tty mode, print characters
	mov si, string	; source the @string variable, see data.asm

	jmp printstring

; subroutines
%include "data.asm"
%include "screen.asm"
%include "stdio.asm"

; padding: fill remaining spaces with 0(510 zeros minus size of previous codes)
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
