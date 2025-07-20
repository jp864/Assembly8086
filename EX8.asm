.8086
.model small
.stack 2048

DATA_HERE SEGMENT
    vector db '1','2','5','4','0'
    soma db 0
    
DATA_HERE ENDS

CODE_HERE SEGMENT
ASSUME CS:CODE_HERE, DS:DATA_HERE


main:
    mov ax, DATA_HERE
    mov ds, ax
    xor si,si




check:

  mov al,vector[si]
  cmp al,'0'
  je fim
 





somaF: 
    sub al,'0'
    mov ah,0
    mov bl,2
    div bl           ;AL- QUOCIENTE , AH- RESTO 
    cmp ah,0
    je continuar

     mov al,vector[si]
     sub al,'0'
     add soma,al 

continuar:
inc si
jmp check




fim:

mov al,soma
add al,'0'
mov dl,al
mov ah,02h
int 21h


mov ah,4Ch
int 21h


CODE_HERE ENDS
END main