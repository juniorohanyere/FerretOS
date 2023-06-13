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
	pusha

	mov ah, 0x00
	int 0x16

	mov [buffer + bx], al	; store character in buffer index (data.asm)

	inc bx	; increment buffer index

	call printc
	cmp al, 0x0d	; check if enter key is pressed
	jne gets

	call kernel

kernel:
	mov ah, 0x00

	mov al, 0x03
	int 0x10

	mov al, [buffer]

	cmp al, 0x0d
	je print

	cmp al, 0x31
	je print

	popa

	mov al, "N"	; for debugging purpose
	call printc
	jmp $
print:
	popa

	mov al, "Y"	; also for debugging purpose
	call printc

	jmp $
