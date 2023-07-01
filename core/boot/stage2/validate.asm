;;
 ; validate - validates availability of user's boot choice
;;

validate:
	mov al, [si]	; si is a pointer to the string
			; we want to perform operation on

	cmp al, 0x00	; check if first character is null
	je load_kernel

	cmp al, 0x31    ; else check if first character is numeriacal key 1
	je validate2

	mov si, invalid
	call prints

	ret

;;
 ; validate2 - checks if second character is valid
 ;	 afer first character is valid
;;

validate2:
	mov al, [si + 1]

	cmp al, 0x00
	je load_kernel

	mov si, invalid
	call prints

	ret

; section .data
invalid: db "Invalid option", 0x00

; subroutine
%include "validate.inc"
