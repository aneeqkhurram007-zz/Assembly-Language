;part a
.model small
.stack 100h
.data
A db 10
B db 20
C db 18
D db 18
StringA db "Value of A = ",A,10,13,'$'
StringB db "Value of B = ",B,10,13,'$'
StringC db "Value of C = ",C,10,13,'$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al, a
    cmp al, b
    jge end
    mov bl, b
    cmp bl, c
    jle end
    mov cl, c
    cmp cl, d
    jg end
    sub bl, cl
    mov a ,bl
    
    mov bl, 0
    mov cx, 4
    for: 
    add bl, 18
    loop for
    
    add a, bl
    
    mov bl, 0
    mov cx, 6
    for1:
    add bl,18
    loop for1
    
    sub a, bl
    
    mov bl, 0
    mov bl, 20
    add a, bl
    
    mov ah, 9
    lea dx, StringA
    int 21h
    lea dx, StringB
    int 21h
    lea dx, StringC
    int 21h
    
    
    end:
    mov dl, a
    mov ah, 4ch
    int 21h
    
main endp
end main

