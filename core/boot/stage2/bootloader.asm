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

	call start_protected_mode

[bits 32]
start_protected_mode:
	mov ebx, boot
	mov ecx, 0
	call prints32

	mov ebx, loading
	mov ecx, 160
	call prints32

	jmp $

%include "data32.asm"
