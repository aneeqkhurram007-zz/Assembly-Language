.model small
.stack 100h
.data
.code
main proc
    
    mov ax, 0000111100001111b
    or ah, 11111111b
    
    mov ah, 4ch
    int 21h 
    
main endp
end main