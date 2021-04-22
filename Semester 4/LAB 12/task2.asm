.model small
.stack 100h
.data      
str1 db "Enter string of 10 characters: $"
str2 db 0Ah,0Dh,"Output: ",0Ah,0Dh,'$'
array db 10 dup(0)
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    lea dx, str1
    mov ah, 9
    int 21h
    
    lea si, array
    
    mov ah, 1
    
    mov cx, 10
    
    loopo:
    
    int 21h
    
    mov [si], al
    
    inc si
    
    loop loopo
    
    
   
    
    mov bx, 9
    
    mov ah, 9
    lea dx, str2
    int 21h
     
    mov ah, 2 
    
    while:  
    cmp bx, 0
    jl end
    
    mov dl, array[bx]
    int 21h
    dec bx
    
    jmp while
    
    
    
main endp
end:
    mov ah, 4ch
    int 21h
end main