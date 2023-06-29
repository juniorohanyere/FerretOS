;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector [stage 2]		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x8000]
[bits 16]

; code segment
section .text
	global _start2

_start2:
	xor ax, ax
	mov ds, ax
	mov es, ax

	mov ah, 0x0e
	mov si, head3
	lodsb
	int 0x10
	lodsb
	int 0x10
;	call printc
;	call prints

;	jmp start2
;	cli
;	hlt
	popa
	jmp $

head3: db "How", 0

; subroutine
;%include "stage2/bootsector.inc"

times 512 db 0
dw 0xface
;times ((0x400) - ($ - $$)) db 0x00
