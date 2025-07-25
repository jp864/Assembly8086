.8086
.model small
.stack 2048

DATA_HERE SEGMENT
    V1 DB 1,2,3,4,5,'0'
    V2 DB 1,2,3,2,'0'
    V3 DB 22 DUP(?) 
DATA_HERE ENDS

CODE_HERE SEGMENT
ASSUME CS:CODE_HERE, DS:DATA_HERE


MAIN:
    mov ax, DATA_HERE
    mov ds, ax
    xor si,si                      ;VETOR 1 ->SI
    xor di,di                      ;VETOR 2->DI
  
identificaV1:
    mov al,V1[si]
    cmp al,'0'
    je identificaV2
    inc si
jmp identificaV1

identificaV2:
    mov al,V2[di]
    cmp al,'0'
    je comparaTam
    inc di
jmp identificaV2

comparaTam:
    cmp si,di
    jb guardaSI
    ja guardaDI


guardaSI:                       
    mov cx,si
    mov bx,di      ;guarda2vetor
    xor si,si
    push cx
    jmp cicloMenor
    
guardaDI:                     
    mov cx,di
    mov bx,si  ;guarda1vetor
    xor si,si
    push cx
        ;1-CICLO-MINIMO-MULTIPLO COMUM
cicloMenor:

    mov al,V1[si]
    cmp al,'0'
    je fimciclo
    add al,V2[si]
    mov V3[si],al
    add V3[si],30h
    mov dl,V3[si]
    mov ah,02h
    int 21h
    inc si
    loop cicloMenor

fimciclo:
    pop cx
    ;bx-tamanho do maior vetor | cx-menor
    ;comecar em cx acaba no final 
    sub bx,cx       ; bx-cx = quantos elementos faltam imprimir
    mov si, cx
    mov cx,bx            ;percorre bx

cicloMaior:
    cmp cx,0
    je fim
    mov al, V1[si]
    mov ah, V2[si]

    ; Se V1 acabou, imprime só V2
    cmp al, '0'
    je imprime_ah

    ; Se V2 acabou, imprime só V1
    cmp ah, '0'
    je imprime_al

    ; Se ambos tem valor sempre soma 
    add al,ah
    mov dl,al
    add dl,30h
    mov ah,02h
    int 21h
    inc bx 
    loop ciclomaior
    jmp fim



imprime_al:           ; Só V1 tem valor
    mov dl, al
    add dl, 30h
    mov ah, 02h
    int 21h
    inc bx
    loop cicloMaior
    jmp fim

imprime_ah:           ; Só V2 tem valor
    mov dl, ah
    add dl, 30h
    mov ah, 02h
    int 21h
    inc bx
    loop cicloMaior
    jmp fim


imprimes1:            ; V1[bx] > V2[bx]
    mov dl, al
    add dl, 30h
    mov ah, 02h
    int 21h
    inc bx
    loop cicloMaior
    jmp fim

imprimes2:            ; V2[bx] > V1[bx]
    mov dl, ah
    add dl, 30h
    mov ah, 02h
    int 21h
    inc bx
    loop cicloMaior

fim:
    mov ah,4Ch
    int 21h


CODE_HERE ENDS
END MAIN