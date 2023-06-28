section .text

;;
 ; read_disk - function to read from disk
;;

read_disk:
	pusha
	push dx

	mov ah, 0x02	; BIOS read sector mode
	mov al, dh	; dh => number of sectors to read
	mov ch, 0x00	; ch => cylinder, select cylinder 0
	mov cl, 0x02	; cl => sector
			; 0x01 is the bootsector (base)
			; 0x02 is the first available sector
			; select the second sector on the track,
			; "it isn't a typo"
			; start reading from second sector
			; i.e. after the boot sector
	mov dh, 0x00	; dh => head number, select head 0
			; select the track on first side of floppy disk
			; count of the sides of a floppy disk starts from 0
	; mov dl, 0x80
	; dl => drive number. Our caller sets it as a parameter
	; and gets it from BIOS.
	; 0 => floppy, 1 => floppy2, 0x80 => hdd, 0x81 => hdd2

	int 0x13	; BIOS interrupt

	jc disk_error	; if carry

	pop dx
	cmp al, dh	; if al (sectors read) != dh (sectors expected)
	jne sectors_error

	popa

	ret

;;
 ; disk_error - prints error message to stdout
;;

disk_error:
	mov bx, derror
	call printstring
	call printnewline

	; mov dh, ah	; ah => error code
			; dl => disk drive that dropped the error

	ret
;;
 ; sectors_error - prints error message to stdout
;;

sectors_error:
	mov bx, serror
	call printstring
	call printnewline

	ret

reset_disk:
	mov ah, 0	; BIOS reset disk function

	int 0x13

	jc reset_disk	; if carry flag is set, there was an error
			; try resetting again
	ret
