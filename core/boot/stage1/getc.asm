section .text

;;
 ; getc - checks for key press
 ;
 ; Description: saves the value of the key pressed into 'al'
 ;		a newline is sent along with this function on success
;;

getc:
	; push all registers to the stack
	pusha

	mov ah, 0x00	; wait for key press
	int 0x16	; moves key press into al

	; restore all pushed registers
	popa

	call printnl

	ret
