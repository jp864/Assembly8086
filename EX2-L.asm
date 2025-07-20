.8086
.model small
.stack 2048

data segment
    Vector1 db 'a','b','c','d',0
    Vector2 db 5 dup('$')
data ends 

code segment
    assume cs:code,ds:data

main:
    mov ax, data
    mov ds, ax
    
    xor si, si           ; SI = 0
    jmp verifica         ; vai para ciclo

verifica:
    mov al, Vector1[si]
    cmp al, 0            ; chegou ao fim?
    je fim               ; se sim, termina


    ;diferenca para o N : o N precisa de ler o valor armazenado(passando de novo para AL) e converter usando o 30h - 0




move:
    mov al, Vector1[si]      ; copia caractere
    mov Vector2[si], al      ; guarda em Vector2
    
    mov dl, al               ; imprime diretamente (já é ASCII)
    mov ah, 02h
    int 21h

    inc si
    jmp verifica

fim:
    mov ah, 4Ch
    int 21h

code ends
end main
