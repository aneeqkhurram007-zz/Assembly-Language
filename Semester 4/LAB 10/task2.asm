; reverse a bit pattern 
.model small
.stack 100h
.code
.data
main proc
    
    mov al, 11011100b
    mov cx, 8
    
    top:
        shl al, 1
        rcr bl, 1
        ;rol al, cl
    loop top      
   
    
main endp
end:
    mov al,bl
    mov ah, 4ch
    int 21h
end main