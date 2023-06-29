;;
 ; header - print the value of @head
;;

header:
	mov si, head
	call prints	; prints the string to stdout
	call printnl	; prints a new line

	ret
;;
 ; continue - print the value of @cont
;;

continue:
	mov si, cont
	call prints

	ret
