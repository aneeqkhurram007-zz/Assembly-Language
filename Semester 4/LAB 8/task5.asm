; task 5
.model small
.stack 100h
.data
msg1 db 'The sum is 1050.$'
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov cx, 100
    mov ax, 0
    
    for:
       
       add ax, cx
       sub cx, 4
    
    loop for
    
    mov dx, ax
    
main endp 

mov ah, 4ch
int 21h

end main