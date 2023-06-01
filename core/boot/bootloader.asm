; simple bootloader program

[bits 16]	; use 16 bits
[org 0x7c00]	; start address

; code section
section .text
	global _start

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

string:
	db "Line OS", 0	; the string to print

; magic number
times 510 - ($-$$) db 0

; boot signature
dw 0xaa55
