.8086
.model small
.stack 1000h

data segment
    Address1 db 13
    Address2 db 10
    Address3 db '?'
data ends

code segment
    assume cs:code,ds:data

start:
    mov ax, data
    mov ds, ax

    ; Soma os valores
    mov ah, [Address1]
    add ah, [Address2]
    mov Address3, ah       ; resultado: 23
    
    

    ; Dividir por 10
    mov al, ah             ; AL = 23
    mov ah, 0
    mov bl, 10
    div bl                 ; AL = 2 (dezena), AH = 3 (unidade)
    
    mov ch,ah;

    ; Mostrar apenas a dezena
    mov dl, al             ; DL = 2
    add dl, 30h            ; DL = '2'
    mov ah, 02h            ; Função imprimir caractere
    int 21h



    mov dl,ch
    add dl,30h
    mov ah,02h
    int 21h

    ; Terminar programa
    mov ah, 4Ch
    int 21h

code ends
end start
