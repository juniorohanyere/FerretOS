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

%include "data.asm"
%include "screen.asm"
%include "stdio.asm"

; fill remaining spaces with 0
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
