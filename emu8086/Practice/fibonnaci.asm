.model small
.stack 100h
.data
msg1 db "Enter series number: $"
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov cx, 5
    
    for: 
    
    mov ax, cx
    push ax
    
    call fibonnaci
    
    call decimalOutput
    
    mov ah, 2
    mov dx, 10
    int 21h
    
    
    loop for
    
    
main endp
    mov ah, 4ch
    int 21h  

fibonnaci proc
   
   push bp
   
   mov bp, sp
   
   cmp [bp+4], 1
   
   jg else
   
   mov ax, [bp+4]
   
   jmp return 
   
   else:
   
   mov bx, [bp+4]
   dec bx
   push bx
   call fibonnaci
   mov cx, [bp+4]
   mov dx, ax
   
   mov bx, [bp+4]
   sub bx, 2
   push bx
   call fibonnaci
   
   add ax, dx
   
   
    
return:
pop bp    
ret 2   
fibonnaci endp    
    
    
decimalOutput proc

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

IF:

    xor cx, cx
    mov  bx, 10d

loopRepeat: 

    xor dx, dx
    div bx
    push dx
    inc cx


    or  ax, ax
    jne   loopRepeat
    
    mov   ah, 2

printLoop:

   pop  dx
   or dl, 30h
   int 21h
   loop  printLoop

   pop dx
   pop cx
   pop bx
   pop ax

ret
decimalOutput endp

end main