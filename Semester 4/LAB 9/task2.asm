; task 2 star nested loop
.model small
.stack 100h
.data
.code
main proc
    
    mov cx, 5
    mov ah, 2
    
    outer_while:
    cmp cx, 0
    jle end_outer_while
    mov bx, 0
    inner_while:
    cmp bx, cx
    jge end_inner_while
    mov dl, '*'
    int 21h
    inc bx
    jmp inner_while
    end_inner_while:
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    dec cx
    jmp outer_while
    
main endp
    end_outer_while:
    mov ah, 4ch
    int 21h
end main