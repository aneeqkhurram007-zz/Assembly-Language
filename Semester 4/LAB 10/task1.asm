;factorial of a number
.model small
.stack 100h
.data

msg1 db "Enter a number to find factorial: $"
num  db ?
sum  db 0
subSum db 0 
i db 0
j db 0
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 1
    int 21h
    
    mov num, al
    
    sub num, 48
    
    cmp num, 0
    je if
    
    else:
        mov cl, num
        mov sum, cl
        dec cl
        mov i, cl
        while:
            cmp i, 1
            jle end
            
            mov dl, sum
            mov subSum, dl
            
            mov sum, 0
            mov j, 0
            
            
            
            while1:
            mov dl, subSum
            mov cl, i
            cmp j, cl
            jge exit
            
            add sum, dl
            inc j
            jmp while1
            
            
            
                
         exit:   
            dec i
            jmp while
    if:
        mov sum, 1
        jmp end
    
    
main endp
    end:
    mov dl, sum
    mov ah, 4ch
    int 21h
end main