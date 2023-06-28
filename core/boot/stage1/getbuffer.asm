section .text

;;
 ; getchar - checks for key press
 ;
 ; Description: saves the value of the key pressed into 'al'
 ;		a newline is sent along with this function on success
;;

getchar:
	; push all registers to the stack
	pusha

	mov ah, 0x00	; wait for key press
	int 0x16	; moves key press into al

	; restore all pushed registers
	popa

	call printnewline

	ret
