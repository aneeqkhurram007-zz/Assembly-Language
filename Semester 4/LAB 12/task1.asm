;task1
.model small
.stack 100h
.data
byte_array db 10h,20h,30h
word_Array dw 1000h,2000h,3000h
sums dw 0,0 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 3
    lea si, byte_array
    loopo:
        add dl, [si]
        inc si
    loop loopo
    
    mov sums[0], dx            
    
    mov dx, 0
    
    mov cx, 3
    lea si, word_Array
    loops:
        add dx, [si]
        add si, 2
    loop loops 
   
        
    
main endp
end:
    mov sums[1], dx
    mov ah, 4ch
    int 21h
end main