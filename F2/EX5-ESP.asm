.8086
.model small
.stack 2048

DATA_HERE SEGMENT

    START db 'Teste quantos espacos tem',0 
    COUNT db 0                             ; Variável para contar espaços em branco

DATA_HERE ENDS

CODE_HERE SEGMENT
ASSUME CS:CODE_HERE, DS:DATA_HERE

home:
    mov ax, DATA_HERE      
    mov ds, ax

    xor si, si             
    jmp verifica           

verifica: 
    mov al, START[si]      ; Lê o caractere atual da string
    cmp al, 0              ; Verifica se chegou ao fim (caractere 0)
    je fim                 ; Se sim, salta para o fim

    inc si                 ; Avança para o próximo caractere

    cmp al, ' '            
    je conta               

    jmp verifica           ; Se não for espaço, continua verificando

conta: 
    inc COUNT             
    jmp verifica           

fim:
    

    mov al, COUNT          ; Carrega o número de espaços encontrados
    add al, 30h            ; Converte número para caractere ASCII
    mov dl, al             ; Coloca em DL para imprimir
    mov ah, 02h            
    int 21h                ; Imprime o número

    ; Termina o programa
    mov ah, 4Ch
    int 21h

CODE_HERE ENDS
END home
