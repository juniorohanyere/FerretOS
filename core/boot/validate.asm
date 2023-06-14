;;
 ; - choice - validates availability of user's boot choice
;;

choice:
	mov al, [buffer]

	cmp al, 0x0d
	je choice1      ; expected to load the selected OS kernel

	cmp al, 0x31    ; is input numerical key 1?
	je ch1

	jmp choice0     ; expected to print an invalid message

;;
 ; choice0 - expected to print invalid choice
 ;	     and prompt for right choice
;;

choice0:
	call _clear

	mov al, "N"	; 'N' means 'No' (invalid choice)
	call printc

	ret

;;
 ; choice1 - expected to load OS kernel
;;

choice1:
	call _clear

	mov al, "Y"	; 'Y' means 'Yes' (valid choice)
	call printc
	ret
;;
 ; ch1 - checks if second character is valid
 ;	 afer first character is valid
;;

ch1:
	mov al, [buffer + 1]

	cmp al, 0x0d
	je choice1

	jmp choice0

	ret
