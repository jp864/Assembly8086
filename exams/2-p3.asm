.8086
.model small
.stack 2048

dados segment para 'data'
     vetor db "ola z0"
    
    
dados ends

codigo segment para 'code'

main proc
assume cs:codigo, ds:dados
mov ax, data
mov ds, ax

xor si,si

cic: mov al,vetor[si]
     cmp al,'0'
     je SAI
    cmp al,'z'
    je meteA

detecta:
    cmp al,'a'
    ja below_question_z
    jmp jumpa

below_question_z:
    cmp al,'z'
    jb soma
    jmp jumpa
soma:
    add al,1
    mov vetor[si],al
    jmp jumpa
meteA:
    mov vetor[si],'a'
    

jumpa:
inc si
jmp cic

SAI:
    mov ah,4Ch
    int 21h

main endp
codigo ends
end main


