.8086
.model small
.stack 2048

    data segment
     Vetor1 db 29,2,6,15,12,25,7,11,100,23,0
    Vetor2 db 10 dup(?) 
    data ends
       
    code segment
        assume cs:code, ds:data

    main:   
    mov ax, data
    mov ds, ax

    xor si,si                   ;indice do vetor1

    xor di,di                   ;indice do vetor2


 
   
ciclo:                                  ; ciclo para verificar se chegou ao fim , e dar skip aos negativos 0 e 1


    mov al,Vetor1[si]
    cmp al,0
    je fim
    cmp al,2
    jae check_primo
    inc si
 jmp ciclo
    jmp fim


check_primo:
    mov bl, 2          ; divisor inicial

primo_loop:
    mov al, bl
    mul al             ; AX = bl * bl (quadrado do divisor)

    mov dl, Vetor1[si]  
    xor dh, dh         ; limpa DH , DX com numero

    cmp ax, dx         
    ja e_primo         ; se AX > número, é primo

    mov ax, 0          
    mov al, Vetor1[si] ; carregar para al para dividir
    xor dx, dx         

    div bl             ; divide número por bl
    cmp ah, 0          ; verifica resto
    je nao_primo       ; divisível, não primo

    inc bl             ; 2,3,4,5  
    jmp primo_loop




    e_primo:
    mov ax, si        ; copia SI para AX
    mov al, al        ; AL agora tem os 8 bits baixos de AX (= SI baixo)
    mov Vetor2[di],al
    mov dl,Vetor2[di]
    add dl,'0'
    mov ah,02h
    int 21h
    inc di
    inc si
    jmp ciclo


nao_primo:
    inc si
    jmp ciclo



fim:
    mov ah, 4Ch
    int 21h

code ends
end main