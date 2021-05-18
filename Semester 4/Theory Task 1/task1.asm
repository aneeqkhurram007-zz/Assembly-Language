.model small
.stack 100h
.data
msg1 db 'Enter a string: $'
msg2 db 0Ah,0Dh,'Forward: $'
msg3 db 0Ah,0Dh,'Backward: $'
msg4 db 0Ah,0Dh,'It is a Palindrome. $'
msg5 db 0Ah,0Dh,'It is not a Palindrome. $'
arr  db 10 dup('$')
counter db 0
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1
    lea si, arr
    int 21h
    
    while:
        mov [si], al
        cmp al, 0Dh
        je exit
        
        inc si
        inc counter
        int 21h
        jmp while
                
    exit: 
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    lea si, arr
    mov ah, 2 
    
    mov dl, 0Dh
    int 21h
    
    mov dl, 0Ah
    int 21h
    
    mov cx, 0   
    mov cl, counter     
        
    for:
        mov dl, [si]
        int 21h
        inc si  
        
    loop for 
        
    
    mov ah, 9
    lea dx, msg3
    int 21h
    
    lea si, arr
    mov ah, 2
    
    mov dl, 0Dh
    int 21h
    
    mov dl, 0Ah
    int 21h
    
    mov cx, 0
    mov cl, counter
    
    mov bx, 0
    mov bl, counter
    
    inc cx
    
    for1:
        
        mov dl, [si + bx]
        int 21h
        dec bx
    
    
    loop for1
    
    mov ah, 9
    lea dx, msg4
    int 21h
    
    mov ah, 4ch
    int 21h    
       
    
main endp
end main