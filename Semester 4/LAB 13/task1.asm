.model small
.stack 100h
.data
msg2 db 0Ah,0Dh,"Reverse: $"   
str1 db "Aneeq Khurram$"
str2 db 16 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
  
    
    while:
    cmp [si], '$'
    je end_while
    inc si
    inc bx
    jmp while
    
    end_while:
    
    std
    
    lea si, str1 + bx
    lea di, str2
    
    mov cx, bx
    inc cx
    for:
    
    movsb
    
    add di, 2
    
    loop for
    
    movsb
    
    mov ah, 9
    
    lea dx, msg2
    int 21h
    
    lea dx, str2
    int 21h
    
   
    
    mov ah, 4ch
    int 21h
    
    
    
 
main endp
end main