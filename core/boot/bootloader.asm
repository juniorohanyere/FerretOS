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

	call printnl

	mov bx, cont
	call prints

	call getc	; gets key press

	call clear

	mov bx, string
	call prints
	call printnl

	call printnl

	call options

	xor bx, bx
	call gets

	jmp $

%include "bootloader.inc"
