; Faça um programa que copie uma cadeia de caracteres de um vector de bytes
; para outro. Os endereços iniciais dos vectores são respectivamente Vector1 e
; Vector2. A cadeia de caracteres é terminada por um caracter de valor zero.


.8086
.model small
.stack 2048h

    data segment
        Vector1 db "Ola tudo bem",0
        Vector2 db 13 dup (?)
    data ends
    
    code segment
        assume cs:code,ds:data
    


main: 

    mov ax,data
    mov ds,ax
    mov es,ax
    ; inicializar data

    mov si, offset Vector1    ; Carrega o offset de Vector1 em SI
    mov di, offset Vector2    ; Carrega o offset de Vector2 em DI

ciclo:

    mov al,[si]
    cmp al,0
    je fim 
    mov [di],al
    inc si
    inc di
    jmp ciclo



fim:
   mov byte ptr [di],'$'
   



   lea dx,Vector2
   mov ah,09h
   int 21h
   
   mov ah,4Ch
   int 21h
   
code ends
end main