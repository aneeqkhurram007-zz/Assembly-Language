; lab 6 and  7 task 2
.model small
.stack 100h
.data
.code
 mov ax, @data
 mov ds, ax
main proc
    
    
    ;task 2.1
    cmp ax, 0
    jl IF
    
    mov ah, 4ch
    int 21h
    
    IF:
        mov bx, -1  
        
    ;task 2.2
    
    cmp al, 0
    jl IF
    
    mov ah, 0
    
    mov ah, 4ch
    int 21h
    
    IF:
        mov ah, 0FFh
    
    
    
    
    
main endp
 mov ah, 4ch
 int 21h
end main