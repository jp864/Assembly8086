.8086
.model small
.stack 2048

DATA_HERE SEGMENT
    VECTOR1 db 1, 2 ,3, '0' 
    VECTOR2 db 1 ,2 ,3, '0'
    VECTOR3 db 8 dup(?) 
DATA_HERE ENDS

CODE_HERE SEGMENT
ASSUME CS:CODE_HERE, DS:DATA_HERE

start:

    mov ax, DATA_HERE
    mov ds, ax
    xor si,si
    jmp soma    

end1:
 mov ah, 4Ch
 int 21h



soma:
    mov al,VECTOR1[si]
    add al,VECTOR2[si]
    mov VECTOR3[si],al
    cmp VECTOR1[si],'0'
    jne print
    jmp end1
   


 print:

    mov al,VECTOR3[si]
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h


    inc si
    jmp soma




CODE_HERE ENDS
END start