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

;;
 ; options - print the value of @opt1 and @opt2
 ;
 ; Description: expected to read from disk
 ;		to determine the options to display
;;

options:
	mov si, opt1
	call prints
	call printnl

	mov si, opt2
	call prints
	call printnl

	call printnl

	ret
