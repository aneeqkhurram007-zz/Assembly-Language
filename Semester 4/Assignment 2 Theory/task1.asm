.model small
.stack 100h
.data 

input db "Enter a binary number: $"
output db 10,13,"Output: $" 

.code
main proc 
     
    mov ax, @data
    mov ds, ax 
    
    ;input code
    mov ah, 9
    lea dx, input
    int 21h
    
    xor bx, bx
    mov ah, 1
    int 21h 
    
while: 

    cmp al, 0Dh
    je end_while    
    
    and al, 0Fh
    shl bl, 1
    or bl, al
    int 21h
    jmp while
    
end_while:
    
    ;output code
    mov ah, 9
    lea dx, output
    int 21h 
    
    mov ah, 2
    
    mov cx, 16
    
top:
    rol bx, 1
    jnc if
    mov dl, 1
    jmp else
if:
    mov dl, 0
    
else:

    add dl, 48
    int 21h
    
    loop top         
             
    mov ah, 4ch
    int 21h         
    
main endp 

    
end main