; section .data

;;
 ; @head: string to print an header
 ; @cont: string prompting the user to continue
 ; @derror: disk error message
 ; @serror: sector error message
;;

head: db \
	"CLIMB-Command_Line_Interface_Multi-Bootloader-v1.0.0_(pre-release)", \
	0x00	; null terminated => 0x00

cont: db "Press Any Key To Continue", 0x00

derror: db "Unable to read from disk", 0x00

serror: db "Incorrect number of sectors read", 0x00
