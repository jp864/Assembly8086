.8086
.model small
.stack 2048

data segment
    TAM equ 5
    NUMERO dw 10230
    QUANT db 0
data ends

code segment
    assume cs:code,ds:data

home:
    mov ax,data
    mov ds,ax
    xor si,si
    mov bx,NUMERO

start:
    
    cmp si,TAM
    jne ciclo
    
    jmp acaba

ciclo:
    inc si 
    mov ax,bx
    mov cl,10
    mov ah,0
    div cl

   mov bl, al   ; guarda só o quociente
    mov bh, 0    ; limpa parte alta de BX

    cmp ah,0
    je soma

    jmp start


soma:
    inc [QUANT]
    jmp start


acaba:


    mov al,[QUANT]
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h




    mov ah,4Ch
    int 21h





code ends
end home