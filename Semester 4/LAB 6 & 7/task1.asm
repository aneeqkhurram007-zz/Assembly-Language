;lab 6 & 7 task 1
.model small
.stack 100h
.data
.code  

mov ax, @data
mov ds, ax

main proc 
    
    
MOV AX, 0020h
MOV BX, 00AAH


MOV AH, BL


MOV AL,81
ADD AL,0FEh

MOV AX, 5510h


SUB AL,2


MOV AL,0FEh 


SUB AL,2


MOV BL,8Ch


MOV BH,2Dh


ADD	BX, AX


MOV AX, 1234


MOV BX, AX


MOV CX, AX


ADD CH, AL


ADD AX, 0FFFFh


DEC BX


NEG CX


    
main endp

mov ah, 4ch
int 21h

end main