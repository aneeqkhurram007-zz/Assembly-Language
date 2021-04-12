.model small
.stack 100h
.data
.code
main proc
    mov bx, 00011111b
    mov cx, 16
    
    for:
    rol bx, 1
    jc next
    inc ax
   next:
    loop for 
    
main endp
end:
mov ah,4ch
int 21h
end main