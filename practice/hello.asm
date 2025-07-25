.8086
.model small
.stack 100h        

DATA_HERE SEGMENT
    ola db 'helloworld0'  ;
DATA_HERE ENDS

CODE_HERE SEGMENT
ASSUME CS:CODE_HERE, DS:DATA_HERE

start:
    mov ax, DATA_HERE
    mov ds, ax          ; Inicializa DS com o segmento de dados

    xor si,si

    ciclo:
        mov al,ola[si]
        cmp al,'0'
        je termina
        mov dl,al
        mov ah,02h
        int 21h
        jmp incrementa

   termina: 
    mov ah, 4Ch
    int 21h

    incrementa:
        add si,1
        jmp ciclo

CODE_HERE ENDS
END start