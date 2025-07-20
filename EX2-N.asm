.8086
.model small
.stack 2048

data segment
    Vetor1 db 1,2,3,4,0        ; Vetor de origem com números e terminador 0
    Vetor2 db 7,5 dup('?')       ; Vetor destino com 5 posições inicializadas com '?'
data ends

code segment
    assume cs:code, ds:data

main:
    mov ax, data               ; Carrega o segmento de dados em AX
    mov ds, ax                 ; Inicializa o registrador DS com o segmento de dados

    xor si, si                 ; Zera o índice SI
    xor di,di
    jmp primeiro
    jmp verifica               ; Salta para a verificação do valor atual de Vetor1


verifica:
    mov al, Vetor1[si]         ; Lê o valor atual de Vetor1
    cmp al, 0                  ; Verifica se o valor é 0 (fim do vetor)
    jne move                   ; Se não for 0, continua para o rótulo 'move'

    ; Se for 0, termina o programa
    mov ah, 4Ch                ; Código de função para terminar o programa (INT 21h)
    int 21h                    ; Chamada de interrupção
    
primeiro:
    
    mov al, Vetor2[di]
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h


move:
    
    mov al, Vetor1[si]         ; Copia valor de Vetor1
    mov Vetor2[si], al         ; Armazena no Vetor2

    mov al, Vetor2[si]         ; Lê o valor armazenado
    add al, 30h                ; Converte para ASCII
    mov dl, al
    mov ah, 02h
    int 21h

    inc si
    jmp verifica

code ends
end main
