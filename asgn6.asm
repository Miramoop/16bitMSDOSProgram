; CSCI 268 - Asgn 6 - 16 bit MS-DOS Program
; Miranda Morris
; 4/19/2024
; This code is meant to use the INT21 AH=02 to write
; a null-terminated (0) string "Hello, Assembly", 0 to 
; the console. The string is written twice to the screen.
; First, using the LOOP operation and second using the 
; LOOP created by a jump operation.



section	.text
	global _start ; must be declared for using gcc
_start:     ; tell linker entry point

L1:    
    mov edx, SIZEOF ; move the value of the SIZEOF variable to the edx register 
    mov ecx, msg ; move the value of the msg variables to the ecx register
    mov ebx, 1 ; move the value of 1 to the ebx register (file decriptor (stdout))
    mov eax, 4 ; move the value of 4 to the eax register (sys_write)
    int 0x80 ; call kernel (int 21h does not work in this compiler)
    jmp L2 ; jump to L2 after this loop is over
    int 0x80 ; call kernel (int 21h does not work in this compiler)
    
L2:
    mov edx, SIZEOF ; move the value of the SIZEOF variable to the edx register 
    mov ecx, msg ; move the value of the msg variables to the ecx register
    mov ebx, 1 ; move the value of 1 to the ebx register (file decriptor (stdout))
    mov eax, 4 ; move the value of 4 to the eax register (sys_write)
    int 0x80 ; call kernel (int 21h does not work in this compiler)
    mov eax, 1 ; move the value of 1 to the ebx register (file decriptor (stdout))
    int 0x80 ; call kernel (int 21h does not work in this compiler)

section	.data

msg	db	'Hello, Assembly!',0xa	; message string
SIZEOF	equ	$ - msg			; message string length