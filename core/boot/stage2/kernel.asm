;;
 ; load_kernel - kernel entry point
 ;
 ; Description: loads the kernel into memory
;;

load_kernel:
	mov bp, 0x9000	; set up the stack
	mov sp, bp

	call protected_mode

	ret
