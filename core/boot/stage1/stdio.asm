[bits 16]	; using 16-bits mode

; code segment
section .text

;;
 ; printc - prints a character to stdout
;;

printc:
	mov ah, 0x0e	; tty mode
	int 0x10

	ret

;;
 ; prints - prints a string to stdout
;;

prints:
	lodsb	; load character in al

	call printc	; print the character in al

	cmp al, 0	; is al => null
	jne prints

	mov al, 0x08	; we need to clear the extra space printed
			; the space is a result of the null termination
			; but no worries, we got that covered
	call printc

	ret

;;
 ; printnl - function to print a new line character
;;

printnl:
	mov ah, 0x0e	; character mode (tty)

	; position the cursur to the next line
	mov al, 0x0a	; new line character "\n"
	int 0x10	; print the character

	; position the cursor to the beginning of the line
	mov al, 0x0d	; carriage return character "\r"
	int 0x10	; print the character

	ret

%include "stdio.inc"
