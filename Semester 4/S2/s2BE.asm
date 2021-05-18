.model small
.stack 100h
.data
str1 db 'Input Array: $'    
ARR dw 0,1,2,3,4,5,6,7,1,4
str2 db 'Input Number: $'  
str3 db 'Pairs of elements whose sum is equally to Input Number: $'
.code
main proc
    mov ax, @data
    mov ds, ax  
    
    mov ah, 9
    lea dx, str1
    int 21h
          
    mov ah, 2
    mov dl, 0Ah
    int 21h
    
    mov ah, 2
    mov dl, 0Dh
    int 21h
          
    lea si, ARR
    mov ah, 2
    
    mov cx, 10
    
    while:
        mov bx, [si]
        add bx, 48
        mov dx, bx
        int 21h
        add si, 2
        
        loop while
    
    mov dl, 0Ah
    int 21h
    
    mov dl, 0Dh
    int 21h    
    mov ah, 9
    lea dx, str2
    int 21h
    
    mov ah, 2
    mov dl, 57
    int 21h
    
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    call sumofpair
    
    
  
    
main endp


sumofpair proc 
 
               
    lea si, ARR
    lea di, ARR 
    
   
    
    
    while1:
    
    mov cl, 0
    
    cmp ch, 6
    lea di, ARR
    jge exit1
    
          while2:
            
            mov bx, [si]
            add bx, [di]
            
            cmp cl, 10
            jge exit2
            
            if:
            cmp bx, 9
            jne else
            
            mov ah, 9
            lea dx, str3
            int 21h
            
            mov ah, 2
            
 
            
            mov dl, [si]
            add dl, 48
            int 21h
            
          
            
            mov dl, [di]
            add dl, 48
            int 21h
            
            
            mov dl, bl
            add dl, 48
            int 21h 
            
            mov dl, 0Ah
            int 21h
            
            mov dl, 0Dh
            int 21h
            
            else:
            add di, 2
            inc cl
            jmp while2
            
            exit2:
            
            add si, 2
            inc ch
            jmp while1 
    
    exit1:        
    
            
    ret           
SumOfPair endp    
end main