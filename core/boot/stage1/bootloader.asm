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

	jmp $	; hang here

; subroutines

%include "stage1/bootloader.inc"
