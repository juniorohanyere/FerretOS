[bits 16]

section .text

start:
	call clear

	call header
	call printnl
	call continue

	call getc

	call reset_disk

	call read_stage2 ; read stage 2 from disk

	call read_disk

	mov ah, 0x0e
	mov al, 'Y'
	int 0x10
	call switch32	; switch to protected mode

	ret

read_stage2:
	xor ax, ax	; set the segment where stage 2 will be loaded
	mov ds, ax
	mov es, ax

	mov bx, 0x1000
	mov dh, 0x02

	ret

switch32:
	cli	; disable interrupts
	lgdt [gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:0x1000

	ret

; subroutine
%include "bootloader.inc"
