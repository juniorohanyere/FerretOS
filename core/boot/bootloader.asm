;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot loader		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text	; code segment

;;
 ; _clear_ - calls the clear label in screen.asm
;;

_clear_:
	call clear	; label from screen.asm

;;
 ; start - entry point after clearing the screen
;;

start:
	call header	; print the name of the bootloader
	call printnl
	call continue	; print the string prompting user to continue

	call getc	; gets key press
	call clear

	call header
	call printnl

	call options	; print the bootloader menus

	xor bx, bx	; set bx to index counter
	call gets	; get buffer

	jmp $	; hang

%include "bootloader.inc"
