; section .data

;;
 ; @head: string to print an header
 ; @cont: string prompting the user to continue
 ; @buffer: uninitialized variable to store characters
;;

head: db \
	"CLIMB-Command_Line_Interface_Multi-Bootloader-v1.0.0_(pre-release)", \
	0x00	; null terminated => 0x00

cont: db "Press Any Key To Continue", 0x00

buffer: db 255
