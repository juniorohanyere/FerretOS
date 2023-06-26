[bits 32]	; using 32-bit protected mode

; defining constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f	; the colour byte for each character

prints32:
	pusha
	mov edx, VIDEO_MEMORY

	jmp printsloop32

printsloop32:
	mov al, [ebx]	; ebx is the address of out character
	mov ah, WHITE_ON_BLACK

	cmp al, 0	; check for end of string
	je done32

	mov [edx], ax	; store character + attribute in video memory
	add ebx, 1	; next character
	add ebx, 2	; next video memory position

	jmp printsloop32

done32:
	popa
	ret
