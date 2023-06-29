; section .data

;;
 ; @opt1: first boot option
 ; @opt2: second boot option
 ; @buffer: uninitialized variable to store characters
;;

opt1: db "1. Boot into FerretOS", 0x00

opt2: db "2. System diagnostics", 0x00

buffer: db 255

msg_protected_mode: db "32 bit mode", 0x00

; subroutine
%include "data.inc"
