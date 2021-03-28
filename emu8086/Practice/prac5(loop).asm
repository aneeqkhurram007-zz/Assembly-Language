.model small
.stack 100h
.data
  x dw 0
  y dw 0
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ah, 2
    
    mov cx, 0; 
    parent:
    cmp cx, 5
    jge end_parent
    
    mov x, cx
    mov cx, 5 
    
    child_1:
    cmp cx, x
    jle end_child_1 
    
    mov dl, 32
    int 21h
    loop child_1
    
    end_child_1:
    
    mov y, cx
    add y, cx
    inc y
    mov cx, 0
    child_2:
    cmp cx, y
    jge end_child_2
    mov dl, '*'
    int 21h
    add cx, 2
    loop child_2
    
    end_child_2:
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov cx, x
    add cx, 2
    loop parent
    end_parent:
    mov ah, 4ch
    int 21h
    
main endp

end main