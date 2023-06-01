; simple bootloader program

[bits 16]	; use 16 bits
[org 0x7c00]	; start address

; code wise
section .text
	global _start

; entry point
_start:
	mov ah, 0x0e	; tty mode
	mov si, string	;
printstring:
	lodsb
	cmp al, 0
	je done
	int 0x10
	jmp printstring; jump to printstring, creating an infinite loop
done:
	hlt

string:
	db "Line OS", 0

; magic number
times 510 - ($-$$) db 0
dw 0xaa55
