..8086
.model small
.stack 2048

data segment
    
    
    
data ends

code segment
assume cs:code, ds:data
mov ax, data
mov ds, ax
; Encerrar programa
    mov ah, 4Ch
    int 21h
code ends
end (funcao principal)