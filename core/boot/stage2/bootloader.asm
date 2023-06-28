;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;		boot loader [stage 2]		;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text	; code segment

;;
 ; start2 - entry point after clearing the screen
;;

start2:
	call header	; print the name of the bootloader
	call printnl

	call options
	call printnl

	call printnl

	mov cx, 4

	mov si, buffer

	call gets

;	call protected_mode
	jmp $	; hang here

;[bits 16]
;protected_mode:
;	cli
;	lgdt [gdt_descriptor]
;	mov eax, cr0
;	or eax, 0x1
;	mov cr0, eax
;	jmp CODE_SEG:init_protected_mode
;
;[bits 32]
;init_protected_mode:
;	mov ax, DATA_SEG
;	mov ds, ax
;	mov ss, ax
;	mov es, ax
;	mov fs, ax
;	mov gs, ax
;
;	mov ebp, 0x90000
;	mov esp, ebp
;
;	call start_protected_mode
;
;[bits 32]
;start_protected_mode:
;	mov ebx, msg_protected_mode
;
;	call prints32
;
;	jmp $
%include "stage2/bootloader.inc"
