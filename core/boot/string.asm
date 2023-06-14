header:
	mov bx, msg
	call prints	; prints the string to stdout
	call printnl	; prints a new line

	ret

continue:
	mov bx, cont
	call prints

	ret
