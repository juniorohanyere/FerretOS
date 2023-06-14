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
 ; Description: buffer is limited to two characters
;;

gets:
	mov ah, 0x00	; wait for input
	int 0x16	; mov al, [input]

	mov [buffer + bx], al	; store character in buffer index (data.asm)

	cmp bx, 2	; limiting buffer to two characters
	je loopgs

	call printc	; print each character entered

	inc bx	; increment buffer index

	cmp al, 0x0d	; check if enter key is pressed
	jne gets	; get next character if not enter key

	call choice

	ret

loopgs:
	cmp al, 0x0d	; is input new line?
	je choice

	mov al, 0x0d	; carriage return "\r"
	call printc

	; reprint the availabe characters
	mov al, [buffer]	; buffer[0] as in high level langauge
	call printc
	mov al, [buffer + 1]	; buffer[1]
	call printc

	mov ah, 0x00	; wait for input
	int 0x16	; mov al, [input]

	jmp loopgs	; repeat the process if not new line

; subroutines
%include "getbuffer.inc"
