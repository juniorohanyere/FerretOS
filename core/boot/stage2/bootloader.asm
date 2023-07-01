;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot loader		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text	; code segment

;;
 ; start - entry point after clearing the screen
;;

start:
	xor ax, ax
	mov ds, ax
	mov es, ax

;	mov [boot_drive], dl	; BIOS sets our boot drive in dl
;	mov bx, 0x9000

	call clear

	call header
	call printnl
	call options
	call printnl

	mov cx, 4	; set buffer limit to 4 characters
	mov si, buffer
	call gets	; read/get input

	call validate

	jmp $	; hang here

[bits 16]
protected_mode:
	cli
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:init_protected_mode

; subroutine
%include "bootloader.inc"

[bits 32]
init_protected_mode:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0xb800
	mov esp, ebp

	; uncomment the following lines to debug
	; whether switch to protected mode was successful
	; also uncomment the "debug_protected_mode" label
	; at the buttom of this file

	mov ebx, debug_protected_mode
	call prints32

	jmp kernel	; kernel.asm

debug_protected_mode: db "Protected Mode", 0x00
