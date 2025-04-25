BITS 32
SECTION .data 

title db 'The Dividing Program', 0xa 
len equ $ - title

prompt db 'Please enter a single digit number:', 0xa 
leng equ $ - prompt

closing1 db 'The quotient is:', 0xa 
length equ $ - closing1
closing2 db 'The remainder is:', 0xa 
length2 equ $ - closing2

newline db 0xa  ; Newline character
newlinelen equ $ - newline  ; Length of newline


SECTION .bss 
    num1 RESB 2 
    num2 RESB 2 
    quotient RESB 5
    remainder RESB 5

SECTION .text
GLOBAL _start	
_start:	

;PRINT TIMER
   mov edx,len 
   mov ecx,title32
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   
;PROMPT 1 
   mov edx,leng
   mov ecx,prompt
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

;read in first num
    mov eax,3 ; read
    mov ebx, 0
    mov ecx,num1
    mov edx, 2 
    int 80h 

;PROMPT 2 
   mov edx,leng
   mov ecx,prompt
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

;read in first num
    mov eax,3 ; read
    mov ebx, 0
    mov ecx,num2
    mov edx,2 
    int 80h 



xor ax,ax ;ZERO OUT 

;Convert num1 from string to integer
    mov al, [num1]       ; Load first character into AL
    sub al, '0'          ; Convert from ASCII to integer

    mov bl, [num2]
    sub bl, '0'
    
    xor edx,edx
    
    idiv bl ; AL by BL 
    
    add al, '0'
    mov [quotient], al
    
    add ah, '0'
    mov [remainder], ah
    
;PRINT 'Your answer is:  '
   mov	edx,length     ;message length
   mov	ecx,closing1     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int 0x80


   mov	edx,1     ;message length
   mov	ecx,quotient     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int 0x80
    ; Add a newline after quotient
   mov edx, 1        ; message length for newline
   mov ecx, newline  ; message for newline
   mov ebx, 1        ; file descriptor (stdout)
   mov eax, 4        ; system call number (sys_write)
   int 0x80          ; call kernel
   ;PRINT 'Your answer is:  '
   mov	edx,length2     ;message length
   mov	ecx,closing2     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int 0x80


   mov	edx,1     ;message length
   mov	ecx,remainder     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int 0x80
    ; Add a newline after quotient
   mov edx, 1        ; message length for newline
   mov ecx, newline  ; message for newline
   mov ebx, 1        ; file descriptor (stdout)
   mov eax, 4        ; system call number (sys_write)
   int 0x80          ; call kernel
   ; Add a newline after quotient
   mov edx, 1        ; message length for newline
   mov ecx, newline  ; message for newline
   mov ebx, 1        ; file descriptor (stdout)
   mov eax, 4        ; system call number (sys_write)
   int 0x80          ; call kernel
 mov al,02h     ;
    
    
;end program 
mov	eax,1       ;system call number (sys_exit)
int	0x80        ;call kernel
