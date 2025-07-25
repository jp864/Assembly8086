.model small
.stack 2046
                   ;PASSAR TUDO PARA VECTOR 1 E DEPOIS MOSTRAR
                   
data segment
    Vector1 db "Hoje e dia", '$', 23 dup (?)  ; 34 bytes, suficiente para a string final
    Vector2 db "23/07/25", '$'                ; 8 caracteres + '$'
data ends 

code segment
    assume cs:code, ds:data

main:
    mov ax, data
    mov ds, ax

    lea si, Vector1                          ; Ponteiro para Vector1
    xor di, di                               ; Índice para Vector2

; Encontrar o fim de Vector1 ('$')
find_end:
    mov al, [si]
    cmp al, '$'
    je add_space
    inc si
    jmp find_end

; Adicionar espaço e dois pontos
add_space:
    mov byte ptr [si], ' '                   ; Substitui '$' por espaço
    inc si
    mov byte ptr [si], ':'                   ; Adiciona ':'
    inc si

; Copiar Vector2 para Vector1
copy_v2:
    mov al, Vector2[di]
    cmp al, '$'
    je finish
    mov [si], al                             ; Copia caractere de Vector2
    inc si
    inc di
    jmp copy_v2

; Finalizar com '$'
finish:
    mov byte ptr [si], '$'

; Exibir Vector1
    lea dx, Vector1
    mov ah, 09h
    int 21h

; Encerrar o programa
    mov ah, 4Ch
    int 21h

code ends
end main