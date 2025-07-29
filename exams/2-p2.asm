.8086
.model small
.stack 2048

data segment
     var1 dw 350     ; Word (16 bits)
    var2 db 2       ; Byte (8 bits)
    
    
data ends

code segment
assume cs:code, ds:data

main:

mov ax, data
mov ds, ax

mov al,var2
xor ah,ah
mov bx,var1
mul bx             ; AX=AX*BX



    mov ah, 4Ch
    int 21h
code ends
end main