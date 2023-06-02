; simple bootloader program

[bits 16]	; use 16 bits
;[org 0x7c00]	; start address

; code section
section .text
	global _start

; function to clear the screen
clear:
	pusha
	mov ah, 0x00
	mov al, 0x03
	int 0x10
	mov cx, 0x1000
	popa

; a delay function
delay:
	mov dx, 0x2000

; decrease dx and cx
decrease:
	dec dx
	jnz decrease	; if dx is not zero

	dec cx
	jnz delay	; if cx is not zero

	int 0x10	; interrupt

; entry point
_start:
	mov ah, 0x0e	; tty mode
	mov si, string

printstring:
	lodsb	; load the @string into al
	cmp al, 0	; compare
	je done	;if al equals 0, jump to done
	int 0x10	; interrupt
	jmp printstring; jump to printstring, creating an infinite loop
done:
	hlt	; halt the system

; section .data
string:
	db "Line OS", 0	; the string to print

; fill remaining spaces with 0
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
