.8086
.model small
.stack 2048

data segment
    string db "MAISCULAS PARA minusculas $",0
data ends

code segment
assume cs:code, ds:data
 
 main:
    mov ax, data
    mov ds, ax
    xor si,si
ciclo:
    mov al,string[si]
    cmp al,0
    je fim
    cmp al,'A'
    jae detecta
    inc si
    jmp ciclo


detecta:
    cmp al,'Z'
    jbe muda
    jmp next
muda:
    add al,20h
    mov string[si],al
    jmp next

next:
    inc si
    jmp ciclo

fim:
    lea dx,string
    mov ah,09h
    int 21h

    mov ah, 4Ch
    int 21h
code ends
end main