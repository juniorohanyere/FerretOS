;;
 ; header2 - print the value of @head
;;

header2:
;	mov si, head2
;	call print	; prints the string to stdout

	mov al, 'K'
	call printc
	call printnl	; prints a new line

	ret
print:
	lodsb
	call printc
	cmp al, 0
	jne print
	mov al, 0x08
	call printc
	ret
