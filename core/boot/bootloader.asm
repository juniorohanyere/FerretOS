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
	popa	; return all pushed registers
	ret
;	mov cx, 0x1000

; a delay function
;delay:
;	mov dx, 0x2000

; decrease dx and cx
;decrease:
;	dec dx
;	jnz decrease	; jump to decrease if dx is not zero

;	dec cx
;	jnz delay	; jump to delay if cx is not zero

; entry point
_start:
	call tty

printstring:
	lodsb	; load the @string into al
	cmp al, 0	; compare for end of string
	je keypress	;if al equals 0, jump to keypress
	int 0x10	; interrupt
	jmp printstring; jump to printstring, if not end of string

newline:
	mov ah, 0x0e
	mov al, 0x0D
	int 0x10

	mov al, 0x0A
	int 0x10
	ret

; wait for keypress
keypress:
	call newline

	; push all registers
	pusha

	mov ah, 0x00
	int 0x16

	cmp al, 0	; print a string if a key is pressed

	jg keypressed	; if the value of al is greater, it means a key has been pressed

	; restore registers
	popa

	jmp keypress	; keep the display unchanged until a key is pressed

keypressed:
	call newline
	jmp _start	; repeat the process again

done:
	hlt	; halt the system
tty:
	mov ah, 0x0e	; tty mode (teletype mode)
	mov si, string
	ret

; section .data
string:
	db \
	"CLIOS-Command_Line_Interface_Operating_System-pre-release_v1.0.0", \
	0x00	;;
		 ; the string to print,
		 ; terminating with a carriage return character
		;;

; fill remaining spaces with 0
times 510 - ($-$$) db 0

; magic number
dw 0xaa55
