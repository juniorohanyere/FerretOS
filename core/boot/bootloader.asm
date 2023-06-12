section .text	; code segment

;;
 ; _clear - calls the clear label in screen.asm
;;

_clear:
	call clear	; label from screen.asm

;;
 ; start - entry point after clearing the screen
;;

start:
	mov bx, string

	call prints	; prints the string to stdout

	call printnl	; prints a new line

	call getc	; gets key press

	jmp start	; creates an infinite loop

%include "bootloader.inc"
