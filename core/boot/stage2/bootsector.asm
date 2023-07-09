section .text
	global _start

[bits 32]
_start:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x9000
	mov esp, ebp

	call kernel

[bits 32]
kernel:
	[extern main] ; Define calling point. Must have same name as kernel.c 'main' function
	call main ; Calls the C function. The linker will know where it is placed in memory
	jmp $

%include "../stage1/gdt.asm"

times 256 dw 0xdada
