; defining constants
KERNEL_OFFSET equ 0x1000	; this offset will also be used to link
				; the kernel
[bits 16]

load_kernel:
	xor ax, ax
	mov es, ax
	mov ds, ax

	mov bx, 0x9000

	call clear

	mov si, booting
	call prints
	call printnl

	mov bx, KERNEL_OFFSET	; set the offset address where
				; the kernel will be loaded
	mov dh, 2	; read two sectors

	call read_disk	; function to read disk

	mov si, loading
	call prints
	call printnl

	jmp protected_mode

;;
 ; load_kernel - kernel entry point
 ;
 ; Description: loads the kernel into memory
;;

[bits 32]

kernel:
	; give control to the kernel
	call KERNEL_OFFSET

	jmp $

booting: db "booting into FerretOS...", 0x00

loading: db "loading OS kernel...", 0x00
