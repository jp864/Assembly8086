;EXAM 2 - 1 a) && b) EXERCISE  ISEC COIMBRA

.8086
.model small
.stack 2046h

    dados segment para 'data'
        Vector1 db 2,5,1,3,11,'A','$'   ;a)
        Vector2 dw 0,2,3,4,5,60000       ;a)
    
    Vector11 db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,'$'
    Vector22 dw 6,7,8,9,10,11,12,20,30,40,50,60,70,80,2,3,5,8, '$'

    dados ends

    codigo segment para 'code'
    main proc 
    assume cs:codigo,ds:dados        ;extra
    mov ax,dados
    mov ds,ax
    lea si,Vector11
    lea di,Vector22
mov cx, 18
ciclo1:
    mov al,[si]
    add al,1
    mov [si],al
    inc si
    loop ciclo1



mov cx,18
ciclo2:

   mov ax,[di]
    inc ax
    mov [di],ax
    add di,2
    loop ciclo2


fim:
    mov ah,4Ch
    int 21h

main endp
codigo ends
end main