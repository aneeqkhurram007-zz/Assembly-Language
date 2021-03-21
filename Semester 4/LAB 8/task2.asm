; task 2
.model small
.stack 100h
.data 
msg1 db 'Please enter a character: $'
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1
    int 21h
    
    mov bl, al ;for backup
    
    mov cx, 10
    
    mov ah, 2
    mov dl, 0Ah
    int 21h
    
    mov dl, 0Dh
    int 21h
    
    mov dl, bl
    
    for:
    
    int 21h
    
    loop for
    
    
    
    
    
main endp
mov ah, 4ch
int 21h
end main

