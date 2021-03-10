;Question 3
.model small
.stack 100h
.data 

str db "Enter a hex digit A-F : $"
str1 db "In decimal it is $"

.code                        
main proc                    

    mov ax, @data
    mov ds, ax
                           
    mov ah, 9
    lea dx, str
    int 21h                       
                           
    mov ah, 1
    int 21h
    
    mov bl, al
    
    mov ah, 2
    
    mov dl, 0Ah
    int 21h                
    
    mov dl, 0Dh
    int 21h
    
    mov ah, 9
    lea dx, str1
    int 21h   
    
    mov ah, 2 
    mov dl, 49
    int 21h
    
    sub bl, 17
    mov dl, bl
    int 21h
    
main endp

mov ah, 4ch
int 21h

end main