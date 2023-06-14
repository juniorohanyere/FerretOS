section .text	; code segment

;;
 ; _clear - calls the clear label in screen.asm
;;

_clear_:
	call clear	; label from screen.asm

;;
 ; start - entry point after clearing the screen
;;

start:
	call header
	call printnl
	call continue

	call getc	; gets key press
	call clear

	call header
	call printnl

	call options

	xor bx, bx
	call gets

	jmp $

%include "bootloader.inc"
