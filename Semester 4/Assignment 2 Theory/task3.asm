org 100h  

.code
   
    mov ah, 1
    int 21h 
    
input: 

    cmp al, 0Dh
    je end_input    
    
    sub al, 48
    shl bl, 1
    or bl, al
    int 21h
    jmp input
    
end_input:   
    
    mov ah, 2
    mov dl, 0Dh
    int 21h    
    
    mov dl, 0Ah
    int 21h
      
    mov cx, 16
    
output:
    rol bx, 1
    jnc task1
    mov dl, 1
    add dl, 48
    jmp task2
task1:
    mov dl, 0
    add dl, 48
    
task2:
   
    int 21h    
    loop output         
             
           
ret