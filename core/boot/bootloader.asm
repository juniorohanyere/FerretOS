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
	mov bp, 0x9000
	mov sp, bp

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

	call protected_mode
	jmp $	; hang here

[bits 16]
protected_mode:
	cli
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:init_protected_mode

[bits 32]
init_protected_mode:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000
	mov esp, ebp

	call start_protected_mode

[bits 32]
start_protected_mode:
	mov ebx, msg_protected_mode
	jmp $
%include "bootloader.inc"
