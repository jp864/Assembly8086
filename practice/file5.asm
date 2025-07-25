.8086
.model small
.stack 2048

data segment
    Vector1 db "Conta quantos espacos estao aqui",0
    
    
data ends

code segment
    assume cs:code, ds:data

main:
    mov ax, data
    mov ds, ax
    mov si,offset Vector1
    xor bx,bx

ciclo:
    mov al,[si]
    cmp al,0
    je fim
    cmp al,' '
    jne conta 
    inc bx

conta:
    inc si
    jmp ciclo


fim:
    mov ax,bx
    add al,'0'
    mov dl,al 
    mov ah,02h
    int 21h

    mov ah, 4Ch
    int 21h
code ends
end main