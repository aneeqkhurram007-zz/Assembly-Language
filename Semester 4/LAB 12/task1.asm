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
   
     
    mov bx, 4              
    
    mov dx, 0
    
    while: 
    
    cmp bx, 0
    jl end
    
    add dx, word_Array[bx]
    sub bx, 2
    
    jmp while
     
   
        
    
main endp
end:
    mov sums[1], dx
    mov ah, 4ch
    int 21h
end main