; task 3
.model small
.stack 100h
.data   
space dw ?

total dw ?
.code
main proc 
    mov ax, @data
    mov ds, ax
    mov ah, 2
    mov cx, 0
    outer_loop:
    cmp cx, 5
    jge end_outer_loop
    mov space, 4
    sub space, cx
    
    inner_1:
    cmp space, 0
    jl end_inner_1
    
    mov dl, 32
    int 21h
    dec space
    jmp inner_1
    
    end_inner_1:
    mov total, cx
    add total, cx
    inc total
    mov bx, 0
    inner_2:
    cmp bx, total
    jge end_inner_2
    
    mov dl, '*'
    int 21h
    inc bx
    jmp inner_2
    
    end_inner_2:
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    inc cx
    
    
    jmp outer_loop
    
main endp
    end_outer_loop:
    mov ah, 4ch
    int 21h
end main