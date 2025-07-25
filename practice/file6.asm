.8086
.model small
.stack 2048

data segment
    CadCarct db "Como e? Viste ontem que 2 pessoas 3 ganharam o Euromilhoes",'$'
    Min db "Caracteres Minusculos: $"
    Ma db "Caracteres Maiusculos: $"
    Num db "Digitos: $"
data ends

code segment
assume cs:code, ds:data


 ;backend
main:
    mov ax, data
    mov ds, ax
    lea bp,CadCarct
    xor si,si                  ;contar numeros
    xor di,di                  ;contar letras  Maisculas
    xor bx,bx                  ;contar letras Minusculas
ciclo:
    mov al,[bp]
    cmp al,'$'
    je fim
    cmp al,'0'              ; ver numeros
    jb next
    cmp al,'9'
    jbe conta_digito
    cmp al,'A'
    jae contaletras
    inc bp
    jmp ciclo

conta_digito:
    inc si
    inc bp
    jmp ciclo
    

next:
    inc bp
    jmp ciclo

contaletras:
    cmp al,'Z'
    jbe letrasM
    cmp al,'a'
    jae letrasmin
    inc bp
    jmp ciclo

letrasM:
    inc di
    inc bp
    jmp ciclo
letrasmin:
    cmp al,'z'
    ja next
    inc bx
    inc bp
    jmp ciclo







fim:                       ;  MOSTRAR OUTPUT  (FROND END )
    ;print : mensagem:Num
    mov dx, offset Num
    mov ah,09h
    int 21h

    ;                   1) print: quant numeros
    ;-----------------------------------------------------------
    mov dx,si
    add dx,'0'             
    sub dx,1               ;glitch: retirar 1
    mov ah,02h
    int 21h
    ;-------------------------------------------------------------
    ;print: enter
    mov dl, 0Ah          
    mov ah, 02h
    int 21h
    
    ;print: mensagem:Minusculas
    mov dx, offset Min         
    mov ah,09h
    int 21h

                  ;  2) print: quant caracteres [Minusculos]
    ;--------------------------------------------------------------
    mov ax,bx
    xor dx,dx
    mov cx,10
    div cx             ;quociente em ax(dezena) e resto em dx (unidade)

    mov bl,dl

    mov dl,al         ;print (dezenas)
    add dl,30h
    mov ah,02h
    int 21h             
    
    mov dl,bl       ;print (unidades)
    add dl,30h
    mov ah,02h
    int 21h
    
    ;print: enter
    mov dl, 0Ah          
    mov ah, 02h
    int 21h



    ;print: mensagem: Minusculas
    mov dx, offset Ma        
    mov ah,09h
    int 21h


    ;----------------------------------------------------------
      ;  3) print: quant caracteres [Maiusculos] - unidades
        mov ax,di
        mov dx,ax
        add dx,30h
        mov ah,02h
        int 21h


    mov ah, 4Ch
    int 21h
code ends
end main