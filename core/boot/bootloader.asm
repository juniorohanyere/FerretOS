; simple bootloader program
[org 0x7c00]

; variable declarations
section .data
	string db "Line OS", 0xa

; code wise
section .text
	global _start

; entry point
_start:
	; print "Line OS" to standard output
	mov eax, 4	; system call for write
	mov ebx, 1	; file descriptor for stdout
	mov ecx, string	; address of string to print
	mov edx, 13	; number of bytes to print
	int 0x80	; call kernel (interrupt)

	;exit program with status code 0
	mov eax, 1	; system call for exit
	;xor ebx, ebx	; status code 0
	int 0x80	; call kernel (interrupt)

	jmp _start	; jump to _start, creating an infinite loop

	; magic number
	times 510 - ($-$$) db 0
	dw 0xaa55
