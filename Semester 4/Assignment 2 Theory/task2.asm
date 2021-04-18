;task 2
.model small
.stack 100h
.data 
input db "Enter hex input: $"
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
     mov cl, 4
     
     int 21h
     
while:
     cmp al, 0Dh
     je end_while
      
     cmp al, 039h 
     jg letter
     
     and al, 0Fh
     jmp shift
     
letter:
       
     sub al, 037h
     
shift:
    
     shl bx, cl
     
     or bl, al
     
     int 21h
     
     jmp while 
      
end_while:
        
     ;output code
     
     mov ah, 9
     lea dx, output
     int 21h
            
     mov cx, 4
     
     mov ah, 2
     
top:
    
    mov dl, bh
    
    shr dl, 4
    
    cmp dl, 10
    jl character
    
    add dl, 55
    jmp else
    
character:
    
    add dl, 48
    
else:
    
     int 21h
     
     rol bx, 4
     
     loop top
     
     mov ah, 4ch
     int 21h
    
           
main endp
end main
