.8086
.model small
.stack 2048

DATA_HERE SEGMENT
    
    
    
DATA_HERE ENDS

CODE_HERE SEGMENT
ASSUME CS:CODE_HERE, DS:DATA_HERE
    mov ax, DATA_HERE
    mov ds, ax
; Encerrar programa
    mov ah, 4Ch
    int 21h
CODE_HERE ENDS
END