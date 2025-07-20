.8086
.model small
.stack 2046

data segment
    cadeia db '1','a','Z','$'       ; Cadeia a analisar
    contaDigitos db 0               ; Contador de dígitos
    contaMaius   db 0               ; Contador de maiúsculas
    contaMinus   db 0               ; Contador de minúsculas
data ends

code segment
    assume cs:code, ds:data

main:
    mov ax, data
    mov ds, ax
    xor si, si                      ; si = índice 0
    
prox:
    mov al, cadeia[si]              ; lê caractere atual
    cmp al, '$'                     ; fim da cadeia?
    je fim
    inc si                          ; avança índice

    ; Verifica se é dígito
    cmp al, '0'
    jb LetraCheck
    cmp al, '9'
    ja LetraCheck
    inc contaDigitos
    jmp prox

LetraCheck:
    cmp al, 'A'
    jb Letramin
    cmp al, 'Z'
    ja Letramin
    inc contaMaius
    jmp prox

Letramin:
    cmp al, 'a'
    jb prox
    cmp al, 'z'
    ja prox
    inc contaMinus
    jmp prox

fim:
    ; Mostra contaDigitos
    mov al, contaDigitos
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Mostra contaMaius
    mov al, contaMaius
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Mostra contaMinus
    mov al, contaMinus
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Termina programa
    mov ah, 4Ch
    int 21h

code ends
end main
