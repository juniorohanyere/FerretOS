; section .data

;;
 ; @msg: string to print an header
 ; @cont: string prompting the user to continue
 ; @opt1: first boot option
 ; @opt2: second boot option
 ; @buffer: uninitialized variable to store characters
;;

msg: db \
	"CLIMB-Command_Line_Interface_Multi-Bootloader-v1.0.0_(pre-release)", \
	0x00	; null terminated => 0x00

cont: db "Press Any Key To Continue", 0x00

opt1: db "1. Boot into FerretOS", 0x00	; lol, just can't wait to get started :)

opt2: db "2. System diagnostics", 0x00

buffer: db 10

derror: db "Unable to read from disk", 0

serror: db "Incorrect number of sectors read", 0
