[bits 16]	; using 16-bits mode

section .text

;;
 ; prints - function to print strings to the bootloader stdout
;;

prints:
	lodsb	; load the string to al
	cmp al, 0	; check for end of string
	int 0x10	; print the characters
	jne prints	; if al is not equal to 0,
			; jump to prints (loop)

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

	call printn

	ret

;;
 ; printn - function to print a new line character
;;

printn:
	mov ah, 0x0e	; character mode (tty)

	; position the string to the beginning of the line
	mov al, 0x0d	; carriage return character "\r"
	int 0x10	; print the character

	; position the string to the next line
	mov al, 0x0a	; new line character "\n"
	int 0x10	; print the character

	ret
