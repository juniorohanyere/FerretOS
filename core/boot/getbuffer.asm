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

gets:
	;pusha

	mov ah, 0x00
	int 0x16

	mov [buffer + bx], al	; store character in buffer index (data.asm)

	cmp bx, 2
	je loopgs

	call printc

	inc bx	; increment buffer index

	cmp al, 0x0d	; check if enter key is pressed
	jne gets	; get next character if not enter key

	call choice

	;popa
	ret

loopgs:
	cmp al, 0x0d
	je choice

	mov al, 0x0d	; carriage return "\r"
	call printc

	; print the whole visible characters
	mov al, [buffer]
	call printc
	mov al, [buffer + 1]
	call printc

	mov ah, 0x00	; wait for input
	int 0x16	; mov al, [input]

	jmp loopgs	; repeat the process if not new line

choice:
	mov al, [buffer]

	cmp al, 0x0d
	je choice1

	cmp al, 0x31
	je ch1

	jmp choice0

choice0:
	call _clear

	mov al, "N"
	call printc

	ret

choice1:
	call _clear

	mov al, "Y"
	call printc
	ret

ch1:
	mov al, [buffer + 1]

	cmp al, 0x0d
	je choice1

	jmp choice0

	ret
