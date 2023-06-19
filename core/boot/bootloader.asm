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

	mov cx, 4	; set buffer limit to 4 characters
	mov si, buffer	; store buffer into the si register

	call gets	; get buffer and store it in si (buffer)

	call validate	; validate input

	jmp $	; hang here

%include "bootloader.inc"
