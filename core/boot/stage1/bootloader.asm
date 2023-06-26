;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot loader		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text	; code segment

;;
 ; _clear_ - calls the clear label in screen.asm
;;

_clear_:
	call clear	; label from screen.asm

;;
 ; start - entry point after clearing the screen
;;

start:
	call header	; print the name of the bootloader
	call printnl
	call continue	; print the string prompting user to continue

	call getc	; gets key press
	call clear

	call reset_disk

	mov ax, 0x9000	; set the segment address where the stage 2
			; will be loaded
	mov es, ax	; set es segment register to the same value

	xor bx, bx	; set the offset address where stage 2
			; will be loaded => 0x0000

	mov dh, 2	; read two sectors
			; BIOS automatically sets dl
			; for our boot disk number

	call read_disk

	jmp 0x9000:0x0000	; jump to execute stage 2

; subroutines

%include "stage1/bootloader.inc"
