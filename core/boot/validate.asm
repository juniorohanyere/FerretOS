;;
 ; validate - validates availability of user's boot choice
;;

validate:
	mov al, [si]	; si is a pointer to the string
			; we want to perform operation on

	cmp al, 0x00	; check if first character is null
	je load_kernel

	cmp al, 0x31    ; else check if first character is numeriacal key 1
	je ch2

	call printnl

	mov si, opt_inv
	call prints
	call printnl

	ret

;;
 ; load_kernel - expected to load OS kernel
;;

load_kernel:
	call clear

	mov si, loading
	call prints
	call printnl

	mov si, fboot
	call prints
	call printnl

	mov bp, 0x8000
	mov sp, bp

	mov bx, 0x9000
	mov dh, 2

	call read_disk

	ret
;;
 ; ch2 - checks if second character is valid
 ;	 afer first character is valid
;;

ch2:
	mov al, [si + 1]

	cmp al, 0x00
	je load_kernel

	call _clear

	mov al, "N"	; expected to invalidate
	call printc

	ret

%include "disk.asm"
