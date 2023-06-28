[bits 16]	; using 16-bits mode

; code segment
section .text

;;
 ; clearscreen - clears the screen
;;

clearscreen:
	pusha

	; clear the screen
	mov ah, 0x00
	mov al, 0x03
	int 0x10	; interrupt

	popa

	ret
