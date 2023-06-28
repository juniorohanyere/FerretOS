;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot sector [stage 2]		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;[org 0x9000]	; set our segment address for our stage 2
		; far away from our stage 1 segment address
		; the sector will be loaded at 0x9000:0x0000
		; by our stage 1 boot sector

[bits 16]

; code segment
section .text
	global _start2

_start2:
	mov al, 'H'
	mov ah, 0x0e
	int 0x10
	jmp $

times 512 db 0
dw 0x0000
