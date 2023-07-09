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

	call 0x1000	; transfer control to stage 2

	ret

read_stage2:
	xor ax, ax	; set the segment where stage 2 will be loaded
	mov ds, ax
	mov es, ax

	mov bx, 0x1000
	mov dh, 0x04	; read four sectors

	ret

; subroutine
%include "bootloader.inc"
