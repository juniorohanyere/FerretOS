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

	mov bp, 0x9000
	mov sp, bp

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

	call prints32

	jmp $
%include "bootloader.inc"
