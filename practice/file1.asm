.8086
.model small
.stack 1000h

    .data segment
    Address1 db 3
    Address2 db 11
    Address3 db '?'
    data ends
    .code segment
    assume cs:code,ds:data
        

start:
    mov ax,data
    mov ds,ax              ;inicializar
    


    mov ah,Address1
    add ah,Address2
    mov Address3,ah              ;soma resultado caso seja 1 casa

    
    mov bx,10
    div bx  ;obter resto e dar print

    PUSH AX  ;SALVA O DÍGITO DAS UNIDADES (4) NA PILHA.
    
    mov dl,al
    add dl,30h
    mov ah,02h
    int 21h
    
     POP AX ;SALVA O DÍGITO DAS UNIDADES (4) NA PILHA.

    mov dl,ah
    add dl,30h
    mov ah,02h
    int 21h
  
    
    mov ah,4Ch
    int 21h
code ends
end start
