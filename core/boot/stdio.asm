[bits 16]	; using 16-bits mode

; code segment
section .text

printc:
	mov ah, 0x0e	; tty mode
	int 0x10

	ret

prints:
	pusha

	jmp loopc
;;
 ; prints - function to print strings to the bootloader stdout
;;

loopc:
	mov al, [bx]	; bx is the base address for the string

	mov ah, 0x0e	; tty mode
	int 0x10	; print every character encountered during the loop

	add bx, 1	; increment pointer

	cmp al, 0	; compare if al equals 0 (end of string)

	jne loopc	; if not equal to 0, loop

	popa	; restore all pushed registers

	ret

;;
 ; getc - function that checks for keyboard input
 ;
 ; Description: checks whether a key is pressed.
 ;		a newline is sent along with this function on success
;;

getc:
	; push all registers
	pusha

	mov ah, 0x00	; wait for key press
	int 0x16	; moves key press into al
	cmp al, 0	; compare if al is greater than 0
	jng getc	;;
			 ; if al is greater, it means a key has been pressed
			 ; hence, jump to the keypressed function
			;;

	; restore all pushed registers
	popa

	call printnl

	ret

;;
 ; printn - function to print a new line character
;;

printnl:
	mov ah, 0x0e	; character mode (tty)

	; position the string to the beginning of the line
	mov al, 0x0d	; carriage return character "\r"
	int 0x10	; print the character

	; position the string to the next line
	mov al, 0x0a	; new line character "\n"
	int 0x10	; print the character

	ret
