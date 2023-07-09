section .text
	[extern main]	; our kernel is based on this main function
			; it is the entry point of our kernel written in c

[bits 16]

start:
	xor ax, ax
	mov ds, ax
	mov es, ax

	call clear	; clear the screen

	call header	; print the bootloader's name
	call printnl

	call options	; print a list of boot options
	call printnl

	mov cx, 4	; set the maximum number of characters to 4
	mov si, buffer	; the key input will be saved in this pointer
			; for further reference
	call gets	; read key inputs and save in 'si'

	call validate	; jump to the selected boot option

	jmp $	; hang here

load_kernel:
	; switch to protected mode
	; because our kernel is a 32 bit kernel

	cli     ; disable interrupts
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:init32

	ret

[bits 32]

init32:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x9000
	mov esp, ebp

	jmp kernel

[bits 32]

kernel:
	call main ;  jump to the kernel's entry point

	jmp $

; subroutine
%include "bootloader.inc"
