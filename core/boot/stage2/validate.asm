;;
 ; validate - validates availability of user's boot choice
;;

validate:
	mov al, [si]	; si is a pointer to the string
			; we want to perform operation on

	cmp al, 0x00	; check if first character is null
	je loader

	cmp al, 0x31    ; else check if first character is numeriacal key 1
	je validate2

	mov si, invalid
	call prints

	ret

;;
 ; loader - expected to load OS kernel
;;

loader:
	call clear
	call printnl
	call printnl

	call load_kernel

	ret
;;
 ; validate2 - checks if second character is valid
 ;	 afer first character is valid
;;

validate2:
	mov al, [si + 1]

	cmp al, 0x00
	je loader

	mov si, invalid
	call prints

	ret

; section .data
invalid: db "Invalid option", 0x00

; subroutine
%include "validate.inc"
