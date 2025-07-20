.8086
.model small
.stack 2048

data segment
    String db 5, '1', '2', '3', '4', '8'  ; String com tamanho e dígitos
    NumeroG dw 0                          ; Número gerado
    Conta db 0                            ; Contador de iterações
    ErrorMsg db 'ERROR', 0Dh, 0Ah, 0      ; Mensagem de erro com nova linha
data ends

code segment
    assume cs:code, ds:data

main:
    mov ax, data
    mov ds, ax
    xor si, si
    mov cl, String[0]   ; Extrair tamanho (5)
    inc si              ; Começar no primeiro dígito

check:
    cmp Conta, cl       ; Verificar se processou todos os dígitos
    jne transform
    jmp fimA

transform:
    mov al, String[si]  ; Ler caractere
    sub al, '0'         ; Converter para número
    mov ah, 0           ; Zerar AH para AX conter o dígito

    ; Multiplicar NumeroG por 10
    push ax             ; Salvar dígito
    mov ax, NumeroG
    mov bx, 10
    mul bx              ; AX = NumeroG * 10
    jc fimB             ; Overflow se carry
    mov NumeroG, ax
    pop ax              ; Restaurar dígito

    ; Adicionar dígito a NumeroG
    add ax, NumeroG     ; AX = NumeroG + dígito
    jc fimB             ; Overflow se carry
    mov NumeroG, ax     ; Atualizar NumeroG

    inc si              ; Próximo caractere
    inc Conta           ; Incrementar contador
    jmp check           ; Voltar ao loop

fimA:
    ; Exibir NumeroG como dígitos ASCII
    mov ax, NumeroG
    mov bx, 10
    mov cx, 0           ; Contador de dígitos

    ; Extrair dígitos e empilhar
convert:
    mov dx, 0           ; Zerar DX para divisão
    div bx              ; AX ÷ 10 → AX = quociente, DX = resto
    add dl, '0'         ; Converter resto para ASCII
    push dx             ; Empilhar dígito ASCII
    inc cx              ; Contar dígito
    cmp ax, 0           ; Se quociente = 0, termina
    jne convert

    ; Exibir dígitos da pilha
display:
    pop dx              ; Recuperar dígito ASCII
    mov dl, dl          ; Mover para DL
    mov ah, 02h
    int 21h             ; Exibir caractere
    loop display
    jmp fim

fimB:
    ; Exibir "ERROR"
    mov si, offset ErrorMsg
error_loop:
    mov dl, [si]
    cmp dl, 0           ; Fim da string?
    je fim
    mov ah, 02h
    int 21h
    inc si
    jmp error_loop

fim:
    mov dl, 0Dh         ; Carriage return
    mov ah, 02h
    int 21h
    mov dl, 0Ah         ; Line feed
    mov ah, 02h
    int 21h
    mov ah, 4Ch
    int 21h

code ends
end main