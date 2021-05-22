.model small
.stack 100h
.data
.code   

C_TO_F macro C
    mov cl, 5
    mov al, 9
    mul c 
    div cl
    add al, 32
endm

main proc 
     
    mov dl, 37 
    C_TO_F dl
    
    
main endp
end main