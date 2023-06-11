;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]

; code segment
section .text

	global _start

;;
 ; _start - entry point
;;

_start:
	jmp _clear	; first clear the screen
;;
 ; _clear - calls the clear label in screen.asm
;;

_clear:
	call clear	; label from screen.asm

;;
 ; start - entry point after clearing the screen
;;

start:
	mov ah, 0x0e	; tty mode, print characters

	mov si, string	; source the @string variable, see data.asm

	call prints	; prints the string to stdout

	call printn	; prints a new line

	call getc	; gets key press

	jmp start	; creates an infinite loop

; subroutines
%include "bootsector.inc"

; padding: fill remaining spaces with 0
; 510 zeros minus size of previous codes
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
