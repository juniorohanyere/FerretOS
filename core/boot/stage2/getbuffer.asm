section .text

;;
 ; getc - function that checks for keyboard input
 ;
 ; Description: checks whether a key is pressed
 ; 		and saves the value of the key pressed into 'al'
 ;		a newline is sent along with this function on success
;;

getc:
	; push all registers
	pusha

	mov ah, 0x00    ; wait for key press
	int 0x16        ; moves key press into al

	; restore all pushed registers
	popa

	call printnl

	ret

;;
 ; gets - gets buffer from user
 ;
 ; Description: buffer is limited to the value of cx set
 ;		bx is the index counter
;;

gets:
	xor bx, bx	; set bx to 0 (our index counter)

	call key	; keyboard.asm

	ret

; subroutine
%include "stage2/getbuffer.inc"
