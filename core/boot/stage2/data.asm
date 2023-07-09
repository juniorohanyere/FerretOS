; section .data

;;
 ; @opt1: first boot option
 ; @opt2: second boot option
 ; @buffer: uninitialized variable to store characters
;;

opt1: db "1. Boot into FerretOS", 0x00

opt2: db "2. System diagnostics", 0x00

buffer: db 255

boot_drive: db 0x00

invalid: db "Invalid option", 0x00

; dafault: db "Defaulting to first option in 5 seconds", 0x00

; subroutine
%include "data.inc"
