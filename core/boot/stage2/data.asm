; section .data

;;
 ; @head: string to print an header
 ; @opt1: first boot option
 ; @opt2: second boot option
 ; @buffer: uninitialized variable to store characters
 ; @derror: disk error message
 ; @serror: sector error message
;;

buffer: db 255

msg_protected_mode: db "32 bit mode", 0x00

; subroutine
%include "data.inc"
