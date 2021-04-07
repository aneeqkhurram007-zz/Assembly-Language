; part a
.model small

.stack 100h

.data

;variable declaration and initialization
A db 2
B db 5
C db 4
D db 4 
String db "The value for D = 34 and A = -2",10,13,'$'
String1 db "A is Greater $"
String2 db "B is Greater $"
String3 db "C is Greater $"

.code

main proc
      
      mov ax, @data
      mov ds, ax
      ; variable value into registers for backup and other operations
      mov al, A 
      mov bl, B
      mov cl, C
      mov dl, D
      
      cmp al, bl
      jge end
      
      cmp bl, cl
      jg cond2
      
      cmp al, dl
      jl cond2
      
      cond2:
      cmp cl, dl
      jg end
      
      mov D, al 
      add D, al ;D = 2A
      
      add cl, cl ;2C
      add dl, dl ;2D
      
      sub cl, dl ;2C-2D
      
      add D, cl ; D = 2A + 2(C-D)
      
      mov cl, 6
      for:
      add D, 5 
      loop for
      
      neg A
      
      mov ah, 9
      lea dx, String
      int 21h
    
    
    
    ; part b
    ; re initializing of variables
    mov A, 6
    mov B, 5
    mov C, 10
    ; variables into registers for backup
    mov al, A
    mov bl, B
    mov cl, C
   
    
    mov ah, 9
    ; condition check1
    cmp al, bl
    jle cond2
    cmp al, cl
    jle cond2b
    
    lea dx, String1
    int 21h
    jmp end:
    ; condition check 2
    cond2b:
    cmp bl, al
    jle cond3
    cmp bl, cl
    jle cond3
    
    lea dx, String2
    int 21h
    jmp end:
    
    cond3:
    lea dx, String3
    int 21h
    
    
    
   
      
      end:
      mov ah, 4ch
      int 21h
      
main endp

end main