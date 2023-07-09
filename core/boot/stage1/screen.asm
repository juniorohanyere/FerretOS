[bits 16]	; using 16-bits mode

; code segment
section .text

;;
 ; clear - clears the screen
;;

clear:
	pusha

	; clear the screen
	mov ah, 0x00
	mov al, 0x03
	int 0x10	; interrupt

	popa

	ret
;;
 ; _clear - clears the screen
 ;
 ; Description: does not push and pop any register
;;

_clear:
	mov ah, 0x00
	mov al, 0x03
	int 0x10

	ret
