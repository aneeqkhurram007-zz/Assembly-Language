.model small
.stack 100h
.data

String db "Aneeq$"
stringCount db 5
msg db 10,13,"Enter number of bytes to be removed: $"
N db ?
msg1 db 10,13,"Enter starting position: $"
S db ?


.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
again:    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    
    sub al, 48
    mov N, al
    
    cmp al, stringCount
    jge again
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1
    int 21h
    
    sub al, 48
    mov S, al
    
    call delete
    
     
    
main endp

delete proc
     
     mov ah, 2
     
     mov dl, 10
     int 21h
     
     mov dl, 13
     int 21h

     
     mov ah, 9
     lea dx, String
     int 21h 
     

    
    mov bx, 0
    
    mov cl, 0
    mov cl, N
    
    mov dx, 0
    mov dl, S
    
    while:
    
        cmp bx, 05
        jge exit
        
        cmp bx, dx
        jl jump
        
        mov [si], '$'
        
        jump:
        
        inc bx
        inc si
        jmp while
        
        exit:
        
    
     
     mov ah, 2
     
     mov dl, 10
     int 21h
     
     mov dl, 13
     int 21h
     
     mov si, 0
     
     print:
     
     cmp [si], '$' 
     je end
       
     mov dl, [si]
     int 21h
     
     inc si
     
     jmp print   
    
ret

delete endp    
    end:
    mov ah, 4ch
    int 21h    
    
    
end main
