; task 1
.model small
.stack 100h
.data 
msg1 db 'The sum is 4950$'
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 50
    mov dx, 0
    mov ax, 1
for:     
    
    add dx, ax
    add ax, 4
    
    
loop for
     mov bx, dx   ;for backup
     mov ah, 9
     lea dx, msg1
     int 21h
     
main endp
mov ah, 4ch
int 21h
end main



