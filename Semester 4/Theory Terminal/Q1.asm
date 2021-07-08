.model small
.stack 100h
.data 

str1 db 10,13,"Enter value for K.E. : $"
str2 db 10,13,"Enter value for velocity : $"
str3 db 10,13,"Value of M is: $"
KE dw ?
v dw ?
M dw ?

.code   

DEC_IN macro  

push bx
push cx
push dx


local inputStart
inputStart:

mov ah, 2
mov dl, ' '
int 21h

xor bx, bx
xor cx, cx

mov ah, 1
int 21h

local repeat
repeat:

and ax, 000fh
push ax

mov ax,10
mul bx
pop bx
add bx, ax

mov ah, 1
int 21h
cmp al, 0dh
jne repeat

mov ax, bx
or cx, cx

je exit
neg ax

local exit
exit:

pop dx
pop cx
pop bx
endm


    
    
DEC_O macro

push  ax
push  bx
push  cx
push  dx

or ax, ax
jge IF

push ax
mov dl, ' '
mov ah, 2
int 21h
pop ax
neg ax 

local IF

IF:

    xor cx, cx
    mov  bx, 10d
 
local loopRepeat 
loopRepeat: 

    xor dx, dx
    div bx
    push dx
    inc cx


    or  ax, ax
    jne   loopRepeat
    
    mov   ah, 2

local printLoop
printLoop:

   pop  dx
   or dl, 30h
   int 21h
   loop  printLoop

   pop dx
   pop cx
   pop bx
   pop ax


endm 

MAIN_MACRO macro

      mov ah, 9
           
      lea dx, str1
      
      int 21h
           
      DEC_IN 
      
      mov KE, ax  
      
     
      mov ah, 9
           
      lea dx, str2
      
      int 21h

      
      DEC_IN
      
      mov v, ax
      
      mov ax, 0
      mov ax, KE 
      
      mov dx, 2
      
      mul dx
      
      mov KE, ax
      
      mov ax, 0
      
      mov ax, v
      mov dx, v
      
      mul dx 
      
      mov v, ax
      
      mov ax, KE
      
      mov bx, v
      
      div bx
      
      mov M, ax 
      
      mov ah, 9
      lea dx, str3
      int 21h
      
      mov ax, M
      
      DEC_O


endm
    

main proc
        
      mov ax, @data
      mov ds, ax  
      
      MAIN_MACRO

        
main endp
end main