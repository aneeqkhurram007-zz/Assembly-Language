.org 100h

.data

msg db "A is Greater $"
msg2 db "B is Greater $"
msg3 db "C is Greater $"

.code 

main proc
    
    mov ax, @data
    mov ds, ax
    
    mov al, 2
    mov bl, 3
    mov cl, 4
  
    
    cmp al, bl
    jg cond1.1
    
    cond1.1:
    cmp al, cl
    jg cond1.2
    
    cond1.2:
    mov ah, 9
    lea dx, msg
    int 21h
    jmp end:
    
   
    cmp bl, al
    jg cond2.1
    
    cond2.1:
    cmp bl, cl
    jg cond2.2
      
    cond2.2:  
    mov ah, 9
    lea dx, msg2
    int 21h
    jmp end:
    
    
    mov ah, 9
    lea dx, msg3
    int 21h
    
    
    end:
    mov ah, 4ch
    int 21h
    
    
     
    
    
main endp

ret