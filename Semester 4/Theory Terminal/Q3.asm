.MODEL SMALL

.STACK 100h

.DATA 

STR DB 0AH,0DH,"POWER IS: $"

    F DB 1, 2, 3   
    V DB 4, 5, 6
    POWER DB 0           

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        LEA SI, F
        LEA DI, V
        
        MOV DX, 0
        MOV BX, 0
        
        
        
        WHILE:
            
            MOV AL, [SI+BX]
            MOV CL, [DI+BX]
            
            MUL CL           
            
            ADD POWER, AL
            
            CALL decimalOutput
            
            INC BX
            
            CMP BX, 3
            MOV AH ,2
            MOV DL ,','
            INT 21H
            JL WHILE 
            
        MOV AH, 9
        LEA DX, STR
        INT 21H
                  
        MOV AX, 0          
        MOV AL, POWER
        CALL decimalOutput    
        
        MOV AH, 4Ch
        INT 21h
        
    MAIN ENDP

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