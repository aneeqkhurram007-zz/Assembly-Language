; task4
.model small
.stack 100h
.data 
 string db 'The sum is 3725$'
.code 

main proc
      
    mov ax, @data
    mov ds, ax
          
    mov ax, 0
    mov cx, 0
          
    while:

    cmp cx, 0
    jle end_while
    
    add ax, cx
    sub cx, 3
    jmp while
    
main endp 

end_while:

mov ah, 9
lea dx, string
int 21h

mov bx, ax

mov ah, 4ch
int 21h
end main