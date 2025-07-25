.model small
.stack 2046
                  ;PASSAR TUDO PARA O V3
    data segment
        Vector1 db "Este e o exercicio:",'$'  ; 19
        Vector2 db "10",'$'                    ; 2
        Vector3 db 25 dup(?)
    data ends 

    code segment
        assume ds:data,cs:code
    

main:
    mov ax,data
    mov ds,ax

    mov si,offset Vector1
    xor di,di

c1:
    mov al,[si]
    cmp al,'$'
    je e
    mov Vector3[di],al
    inc si
    inc di
    jmp c1

e:
    mov byte ptr Vector3[di],' '
    xor si,si
c2:
    mov al,Vector2[si]
    cmp al,'$'
    je fim
    inc di
    inc si
    mov Vector3[di],al
    jmp c2
fim:
    add di,1
    mov byte ptr Vector3[di],'$'


    lea dx,Vector3  ;  mov dx,offset Vector3
    mov ah,09h
    int 21h

    mov ah,4Ch
    int 21h

code ends 
end main

