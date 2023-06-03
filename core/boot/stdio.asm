%include "stdio.inc"

[bits 16]	; using 16-bits mode

;;
 ; printstring - function to print strings to the bootloader stdout
;;

printstring:
	lodsb	; load the string into al

	cmp al, 0	; check for end of string
	je end_of_string	; if al equals 0, jump to end_of_string function
	int 0x10	; interrupt

	jmp printstring	; loop if not end of string

;;
 ; end_of_string - direct program flow to getchar
;;

end_of_string:
	call newline
	jmp getchar

;;
 ; getchar - function that checks for keyboard input
 ;
 ; Description: checks whether a key is pressed
;;

getchar:
	; push all registers
	pusha

	mov ah, 0x00	; wait for key press
	int 0x16	; moves key press into al
	cmp al, 0	; compare if al is greater than 0
	jg keypressed	;;
			 ; if al is greater, it means a key has been pressed
			 ; hence, jump to the keypressed function
			;;

	jmp getchar	; keeps the display unchanged until a key is pressed

;;
 ; newline - function to print a new line character
;;

newline:
	mov ah, 0x0e	; character mode (tty)

	; position the string to the beginning of the line
	mov al, 0x0D	; carriage return character "\r"
	int 0x10	; print the character

	; position the string to the next line
	mov al, 0x0A	; new line character "\n"
	int 0x10	; print the character

	ret

;;
 ; keypressed - function to process keyboard input
;;

keypressed:
	; restore pushed registers
	popa

	call newline	; new line
	jmp _start	; jump to _start function (infinite loop)
