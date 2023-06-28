; section .data

;;
 ; @head: string to print an header
 ; @opt1: first boot option
 ; @opt2: second boot option
 ; @buffer: uninitialized variable to store characters
 ; @derror: disk error message
 ; @serror: sector error message
;;

head2: db \
	"CLIMB-Command_Line_Interface_Multi-Bootloader-v1.0.0_(pre-release)", \
	0x00	; null terminated => 0x00

buffer: db 255

; derror: db "Unable to read from disk", 0x00

; serror: db "Incorrect number of sectors read", 0x00

msg_protected_mode: db "32 bit mode", 0x00
