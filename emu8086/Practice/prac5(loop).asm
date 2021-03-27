org 100h
.data
  i dw 0
  j dw 0
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ah, 2
    mov cx, 0; cx == i
    for_outer:
    cmp cx, 5
    jge end_for_outer
    mov i, cx
    mov cx, 5
    for_inner_1:
    cmp cx, i
    jle end_for_inner_1
    mov dl, 32
    int 21h
    loop for_inner_1
    end_for_inner_1:
    
    mov j, cx
    add j, cx
    inc j
    mov cx, 0
    for_inner_2:
    cmp cx, j
    jge end_for_inner_2
    mov dl, '*'
    int 21h
    add cx, 2
    loop for_inner_2
    
    end_for_inner_2:
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    mov cx, i
    add cx, 2
    loop for_outer
    end_for_outer:
    mov ah, 4ch
    int 21h
    
main endp

ret