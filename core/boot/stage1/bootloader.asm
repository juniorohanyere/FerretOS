;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot loader ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text ; code segment

;;
 ; start - entry point after clearing the screen
;;

start:
	call clear

	call header	; print the name of the bootloader
	call printnl
	call continue	; print the string prompting user to continue

	call getc	; gets key press

	call reset_disk

	xor ax, ax	; set the segment address where the stage 2
			; will be loaded
	mov ds, ax
	mov es, ax	; set es segment register to the same value

	mov bx, 0x1000	; set the offset address where stage 2
			; will be loaded => 0x0000

	mov dh, 2	; read two sectors
			; BIOS automatically sets dl
			; for our boot disk number

	call read_disk

	jmp 0x1000	; jump to execute stage 2

; subroutines
%include "bootloader.inc"
