.8086
.model small
.stack 2048

DATA_HERE SEGMENT
    V1 DB 1,2,3 ,0
    V2 DB 1,2,3 ,0
    V3 DB 22 DUP(?) 
    msg DB "END$"
    
DATA_HERE ENDS

CODE_HERE SEGMENT
ASSUME CS:CODE_HERE, DS:DATA_HERE


MAIN:
    mov ax, DATA_HERE
    mov ds, ax

    xor si,si
    xor di,di
 
soma:
    
  mov al,V1[si]
  cmp al,0
  je end1
  add al,V2[si]
  mov V3[si],al


imprime:
     
     add al,30h
     mov dl,al
    mov ah,02h
    int 21h
    
    ;--------------ACRESCENTA ESPACO E IMPRIME ------------;
   
    mov al,v1[si+1]                   ;pular espaco no final caso seja o ultimo numero
    cmp al,0
    je salta_espF
    inc di                            ;alocar espacao para o espaco
    mov byte ptr V3[di],' '
    mov dl,V3[di]
    mov ah,02h
    int 21h
    ;-------------------------------------------------------
    inc di                           ;mover para a posicao do prox numero
    inc si                           ;mover para a alocar em soma num                       
    mov al,V1[si]
    cmp al,0
    jmp soma


salta_espF:
    inc si               ;indiferente mas podia ser para o jmp soma e termina
    jmp end1

end1:
  
    lea dx,msg
    mov ah,09h
    int 21h
    mov V3[di], 0   ; terminador em V3
    mov ah, 4Ch
    int 21h


CODE_HERE ENDS
END MAIN