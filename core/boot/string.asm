;;
 ; header - print the value of @msg
;;

header:
	mov bx, msg
	call prints	; prints the string to stdout
	call printnl	; prints a new line

	ret
;;
 ; continue - print the value of @cont
;;

continue:
	mov bx, cont
	call prints

	ret

;;
 ; options - print the value of @opt1 and @opt2
 ;
 ; Description: expected to read from disk
 ;		to determine the options to display
;;

options:
	mov bx, opt1
	call prints
	call printnl

	mov bx, opt2
	call prints
	call printnl

	ret
