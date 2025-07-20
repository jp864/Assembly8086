.8086
.model small
.stack 2046

data segment
    string db 'HOJE E DIA 18', 0  ; String terminada com NULL
data ends

code segment
    assume cs:code, ds:data

main:
    mov ax, data
    mov ds, ax
    xor si, si

check:
    mov al, string[si]
    cmp al, 0
    je fim

    inc si
    cmp al, ' '
    je fixE
    cmp al, '1'
    jae fixN
    jmp imprimeL

imprimeL:
    add al, 20h         ; Converter maiúsculas em minúsculas
    mov dl, al
    mov ah, 02h
    int 21h
    jmp check

fixE:
    mov dl, al
    mov ah, 02h
    int 21h
    jmp check

fixN:
    cmp al, '9'
    jbe printN
    jmp imprimeL

printN:
    mov dl, al          ; Já está em ASCII
    mov ah, 02h
    int 21h
    jmp check

fim:
    mov ah, 4Ch
    int 21h

code ends
end main
