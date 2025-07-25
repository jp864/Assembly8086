.8086
.model small
.stack 2048h

    data segment
    NumElem   word 5
    OldVector db 0,1,2,3,4
    NewVector db 5 dup(?)
    data ends

code segment
assume cs:code, ds:data
  

    main:
    mov ax,data
    mov ds,ax
    lea si,OldVector
    xor bx,bx
    mov cx,NumElem
    ciclo:
    mov al,[si]
    add al,al
    mov NewVector[bx],al
    mov dl,al
    add dl,30h
    mov ah,02h
    int 21h
    inc si
    inc bx
    loop ciclo


   fim:
    mov ah,4Ch
    int 21h

    code ends
end main