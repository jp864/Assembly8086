.8086
.model small
.stack 2048

data segment
    vector dw 10,22,3,463
    buffer db 6 dup('$') ; buffer para 5 dígitos + terminador
data ends

code segment
assume cs:code, ds:data

main:
    mov ax, data
    mov ds, ax

    mov cx, 4          ;num elementos
    xor si, si         
    xor bx, bx         ;acumula soma

ciclo:
    mov ax, vector[si]
    add si, 2

    ; verifica o bit menos significativo
    test ax, 1
    jz nao_soma        ; jz- jump if zero - numero par

    add bx, ax         

nao_soma:
    loop ciclo

    ; bx tem soma --> converter para STRING 
    mov ax, bx
    lea di, buffer + 5 ; aponta para o fim do buffer
    mov cx, 0           
    mov si, 10         

conv_loop:
    xor dx, dx         
    div si             ; quociente - ax | resto - dx
    add dl, '0'        ; resto para ASCII
    dec di
    mov [di], dl
    inc cx
    cmp ax, 0                  ;se quociente tiver terminado
    jne conv_loop


    mov ah, 09h
    mov dx, di
    int 21h

    
    mov ah, 4Ch
    int 21h

code ends
end main
