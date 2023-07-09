section .text

;;
 ; key - accepts input from user
;;

key:
	mov ah, 0x00	; wait for input
	int 0x16	; mov al, [input]

	; first check for backspace
	cmp al, 0x08
	je backspace

	; next, check for enter key
	cmp al, 0x0d	; is input => enter key
	je enter

	; finally, we can now check if input have hit the limit
	cmp bx, cx	; cx is the limit of number of characters to accept
			; bx is the index counter
	je limit	; if bx is equal to cx, jump to limit

	call printc	; print the character

	; save the character into the buffer index
	mov [si + bx], al	; si needs to contain the buffer
				; to save the characters
				; each character is stored into the buffer index
	; then increment the index counter by 1
	; if input have not reached the limit
	inc bx	; else increment bx and continue

	jmp key	; loop to get the next character

;;
 ; backspace - function that handles backspace behaviour
;;

backspace:
	call printc	; al contains the backspace key "0x08"

	mov al, 0x00	; set the cursur'ed character to null
	call printc

	dec bx	; bx needs to be decreased by 1 to keep the flow

	cmp bx, 0
	jl backspace_limit	; remember that our index starts from 0
				; and bx shouldn't be less than 0

	mov [si + bx], al	; bx has been decreased by 1

	mov al, 0x08	; reposition the cursur
	call printc

	jmp key	; transfer control to the original function

;;
 ; backspace_limit - control for index underflow
;;

backspace_limit:
	xor bx, bx	; reset bx to 0

	mov [si + bx], al	; bx has been decreased by 1

	mov al, 0x08	; reposition the cursor
	call printc

	jmp key	; transfer control back to key

;;
 ; enter - function that handles enter key press
;;

enter:
	call printc	; al contains the enter key

	mov al, 0x00
	mov [si + bx], al	; set the last character to null
				; i.e the enter character is set to null
				; a string is expected to be null terminated
				; also, the null termination will be used later
				; to perform operations on the string,
				; e.g printing the string
	ret

;;
 ; limit - handles limit set by cx
;;

limit:
	; don't print anything, don't do anything
	; just transfer contol back to the key function
	; to wait for input again

	jmp key
