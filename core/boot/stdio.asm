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
 ;
 ; Description: transfers control to loopps label
;;

prints:
	pusha

	jmp loopps
;;
 ; loopps - engine for prints
;;

loopps:	; loop prints
	mov al, [bx]	; bx is the base address for the string

	call printc

	add bx, 1	; increment pointer

	cmp al, 0	; compare if al equals 0 (end of string)

	jne loopps	; if not equal to 0, loop

	popa	; restore all pushed registers

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
