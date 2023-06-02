;;
 ; printstring - function to print strings to the bootloader stdout
;;

printstring:
	lodsb	; load the string into al
	cmp al, 0	; check for end of string
	je keypress	; if al equals 0, jump to keypress function
	int 0x10	; interrupt
	jmp printstring	; loop if not end of string

;;
 ; getchar - function that checks for keyboard input
 ;
 ; Description: checks whether a key is pressed
;;

getchar:
	call .newline

	; push all registers
	pusha

	mov ah, 0x00	; wait for key press
	int 0x16	; moves key press into al
	cmp al, 0	; compare if al is greater than 0
	jg .keypressed	;;
			 ; if al is greater, it means a key has been pressed
			 ; hence, jump to the .keypressed function
			;;

	; restore registers
	popa

	jmp getchar	; keeps the display unchanged until a key is pressed

;;
 ; .newline - function to print a new line character
;;

.newline:
	mov ah, 0x0e	; character mode (tty)

	; position the string at the beginning of a newline
	mov al, 0x0D	; carriage return character "\r"
	int 0x10	; print the character

	; position the string at a new line
	mov al, 0x0A	; new line character "\n"
	int 0x10	; print the character

	jmp _start	; jump to _start function (infinite loop)

;;
 ; .keypressed - function to process keyboard input
;;

.keypressed:
	call newline	; new line
	jmp _start	; repeat the process again
