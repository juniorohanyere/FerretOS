; section .data

;;
 ; @head: string to print an header
 ; @cont: string prompting the user to continue
 ; @opt1: first boot option
 ; @opt2: second boot option
 ; @optd: prints a defaulting message
 ; @opt_inv: prints an invalid message
 ; @buffer: uninitialized variable to store characters
 ; @derror: disk error message
 ; @serror: sector error message
 ; @loading: loading kernel message
 ; @fboot: booting into ferret operating system
;;

head: db \
	"CLIMB-Command_Line_Interface_Multi-Bootloader-v1.0.0_(pre-release)", \
	0x00	; null terminated => 0x00

cont: db "Press Any Key To Continue", 0x00

opt1: db "1. Boot into FerretOS", 0x00	; lol, just can't wait to get started :)

opt2: db "2. System diagnostics", 0x00

optd: db "Defaulting option 1 in 5s", 0x00

opt_inv: db "Invalid option", 0x00

buffer: db 255

derror: db "Unable to read from disk", 0x00

serror: db "Incorrect number of sectors read", 0x00

loading: db "Loading kernel...", 0x00

fboot: db "Booting into Ferret OS...", 0x00
