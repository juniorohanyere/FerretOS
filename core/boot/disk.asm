section .text

;;
 ; read_disk - function to read from disk
;;

read_disk:
	pusha
	push dx

	mov ah, 0x02	; read mode
	mov al, dh	; dh => number of sectors to read
	mov ch, 0x00	; ch => cylinder
	mov dh, 0x00	; dh => head number
	mov cl, 0x02	; cl => sector
			; 0x01 is the bootsector
			; 0x02 is the first available sector

	;int 0x13	; BIOS interrupt
	jc disk_error	; if carry

	pop dx
	cmp al, dh
	jne sectors_error

	popa

	ret

;;
 ; disk_error - prints error message to stdout
;;

disk_error:
	mov bx, derror
	call prints
	call printnl

	; mov dh, ah	; ah => error code
			; dl => disk drive that dropped the error

	ret
;;
 ; sectors_error - prints error message to stdout
;;

sectors_error:
	mov bx, serror
	call prints
	call printnl

	ret
