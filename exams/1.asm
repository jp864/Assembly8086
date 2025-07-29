;EXAM - EXERCISE 1 ISEC COIMBRA

.8086
.model small
.stack 2046h

    data segment
    Frase1 db "A UC (unidade curricular) de TAC (Tecnologias e Arquiteturas de Computadores) vai ter uma taxa de aprovacao elevada $"
    Frase2 db 200 dup(' ')
    data ends

    code segment
    assume cs:code,ds:data


main:  
    mov ax,data
    mov ds,ax 

    xor si,si 
    xor di,di

ciclo:

    mov al,Frase1[si]
    cmp al,'$'
    je fim

    cmp al,'('
    je skip

    mov Frase2[di],al


    inc si
    inc di
    jmp ciclo

skip:
    mov al,Frase1[si]
    inc si
    cmp al,')'
    jne skip
    jmp ciclo



fim: 
    inc di
    mov byte ptr Frase2[di],'$'

    mov dx, offset Frase2
    mov ah, 09h
    int 21h

    mov ah,4Ch
    int 21h




code ends
end main