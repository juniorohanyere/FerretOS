section .text

;;
 ; halt - halts or stops the system
;;

halt:
	cli	; clear interrupts
	hlt	; halt the system

	ret
