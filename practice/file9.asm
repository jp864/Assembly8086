.8086
.model small
.stack 2048

    data_here segment
        NUMERO dw 10230
        QUANT db 0
    data_here ends

code segment
    assume cs:code,ds:data_here



main:

    mov ax,data_here
    mov ds,ax

    xor cx,cx
    
    mov ax,NUMERO
conta_digitos:
    
    cmp ax,0
    je fim

    mov dx,0
    mov bx,10
    div bx                 ;ax/10. resultado em ax, resto em dx

    cmp dl,0
    jne proximo
    inc cx

proximo:
jmp conta_digitos


fim:
    mov QUANT,cl
    mov al,QUANT
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h


    mov ah,4Ch
    int 21h


code ends
end main
