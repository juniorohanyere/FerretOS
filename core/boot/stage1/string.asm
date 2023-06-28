;;
 ; header - print the value of @head
;;

header:
	mov si, head
	call printstring	; prints the string to stdout
	call printnewline	; prints a new line

	ret
;;
 ; continue - print the value of @cont
;;

continue:
	mov si, cont
	call printstring

	ret
