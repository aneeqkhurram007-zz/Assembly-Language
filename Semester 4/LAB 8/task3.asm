; task3
.model small
.stack 100h
.data
string db 'Please enter your password.$'
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, string
    int 21h
    
    mov ah, 2
    mov dl, 0Ah
    int 21h
    
    mov dl, 0Dh
    int 21h
    
    mov ah, 1
    mov cx, 5
    
    for:
    int 21h
    loop for
    
    mov cx, 5
    
    mov ah, 2
    mov dl, 0Dh
    int 21h
    
    mov dl, 'X'
    
    for1:
    int 21h
    loop for1
    
main endp   

mov ah, 4ch
int 21h

end main