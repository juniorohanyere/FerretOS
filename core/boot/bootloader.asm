;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot loader		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 16]

;code segment
section .text

;;
 ; _clear - calls the clear label in screen.asm
;;

_clear:
	call clear

;;
 ; start - entry point
;;

start:
	mov ah, 0x0e	; tty mode, print characters

	mov si, string	; source the @string variable, see data.asm

	call prints	; prints the string to stdout

	call printn	; prints a new line

	call getc	; gets key press

	jmp start
