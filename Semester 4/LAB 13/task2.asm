.model small
.stack 100h
.data
msg1 db "Enter string: $"
str1 db 10 dup(0)
.code                    
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    
    lea si, str1
    
    int 21h
    
    
    
    while:
    
    cmp al, 13
    je end
    
    if:
    
    cmp al, 8
    jne else
    
    dec si
    
    int 21h
    
    jmp while
    
    else:
    
    mov [si], al
    
    inc si
    
    int 21h
    
    jmp while
    
    end:
    mov ah, 4ch
    int 21h
    
    
main endp
end main