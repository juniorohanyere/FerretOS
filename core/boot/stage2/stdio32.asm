[bits 32]	; using 32-bit protected mode

; defining constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x07	; the colour byte for each character

prints32:
	pusha

	add ecx, VIDEO_MEMORY	; ecx needs to be set as the location
	mov edx, ecx		; where our string will be printed

	jmp printsloop32

printsloop32:
	mov ah, WHITE_ON_BLACK
	mov al, [ebx]	; ebx is the address of our character

	cmp al, 0	; check for end of string
	je done32

	mov [edx], ax	; store character + attribute in video memory
	add ebx, 1	; next character
	add edx, 2	; next video memory position

	jmp printsloop32

done32:
	popa
	ret
