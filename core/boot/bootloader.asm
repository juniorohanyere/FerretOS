; simple bootloader program

[bits 16]	; use 16 bits
;[org 0x7c00]	; start address

; code section
section .text
	global _start

; function to clear the screen
clear:
	pusha	; push all registers

	mov ah, 0x00
	mov al, 0x03
	int 0x10
	mov cx, 0x1000
	popa	; return all pushed registers

; a delay function
delay:
	mov dx, 0x2000

; decrease dx and cx
decrease:
	dec dx
	jnz decrease	; jump to decrease if dx is not zero

	dec cx
	jnz delay	; jump to delay if cx is not zero

	int 0x10	; interrupt

; entry point
_start:
	mov ah, 0x0e	; tty mode (teletype mode)
	mov si, string

printstring:
	lodsb	; load the @string into al
	cmp al, 0	; compare for end of string
	je keypress	;if al equals 0, jump to keypress
	int 0x10	; interrupt
	jmp printstring; jump to printstring, if not end of string

; wait for keypress
keypress:

	; push all registers
	pusha

	mov ah, 0x00
	int 0x16

	cmp al, 0	; print a string if a key is pressed

	jg newline	; if the value of al is greater, it means a key has been pressed
	int 0x10

	; restore registers
	popa

	jmp keypress	; keep the display unchanged until a key is pressed

newline:
	mov ah, 0x0e	; tty mode, tell the program we're printing characters

	mov al, 0x0D	; carriage return "\r"
	int 0x10

	mov al, 0x0A	; new line "\n"
	int 0x10
	jmp _start	; repeat the process again
	int 0x10

done:
	hlt	; halt the system

; section .data
string:
	db "CLIOS-Command_Line_Interface_Operating_System-pre-release_v1.0.0", 0	; the string to print

; fill remaining spaces with 0
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
