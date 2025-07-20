.8086
.model small
.stack 2048

data segment
    NUMERO dw 10030    ; número a analisar
    QUANT  db 0        ; contador de zeros
data ends

code segment
    assume cs:code, ds:data

home:
    mov ax, data       ; inicializa o segmento de dados
    mov ds, ax

    mov bx, NUMERO     ; número a dividir

start:
    cmp bx, 0          ; se já não há mais dígitos, termina
    je acaba

    mov ax, bx         ; copia número atual para AX
    mov cx, 10         ; divisor
    mov dx, 0          ; zera AH antes da divisão
    div cx            ; AX ÷ DX → AX = quociente, DH = resto

    mov bx, ax        ; passa quociente para BX (próximo número)
   

    cmp dx, 0          ; se o dígito era 0
    jne start          ; se não for, continua o loop

    inc [QUANT]        ; se for 0, incrementa contador
    jmp start          ; continua o loop

acaba:
    mov al, [QUANT]    ; pega quantidade de zeros
    add al, '0'        ; converte para ASCII
    mov dl, al
    mov ah, 02h        ; imprime caracter em DL
    int 21h

    mov ah, 4Ch        ; termina o programa
    int 21h

code ends
end home