.8086
.model small
.stack 2046

data segment
    tam equ 5
    Oldvector db 1,2,3,4,5
    Newvector db tam dup(?)
data ends

code segment
    assume cs:code,ds:data

main:
    mov ax, data
    mov ds, ax
    
    xor si, si  ; zera o índice

loop_dobro:
    mov al, Oldvector[si]     ; lê valor antigo
    add al, al                ; dobra (al = 2 * valor)
    mov Newvector[si], al     ; guarda no novo vetor
    
    

    mov ah, 0
    mov cl,10
    div cl                ;al-dezena , ah- uniodade

    mov ch,ah

    cmp al,0
    je print_unidade
    

    add al,30h
    mov dl,al
    mov ah,02h
    int 21h





print_unidade: ; imprime o valor (em ASCII)
    mov al, ch
    add al, 30h               ; converte número para caractere ASCII
    mov dl, al
    mov ah, 02h
    int 21h




   
    inc si
    cmp si, tam
    jl loop_dobro

    ; Termina programa
    mov ah, 4Ch
    int 21h

code ends
end main
