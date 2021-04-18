org 100h

.code
         
     mov ah, 1
     mov cl, 4
     
     int 21h
     
input:
     cmp al, 0Dh
     je end_input
      
     cmp al, 039h 
     jg task1
     
     sub al, 48 
     shl bx, cl 
     or bl, al 
     
     jmp task2
     
task1:
       
     sub al, 037h
     shl bx, cl
     or bl, al
     
task2:
     
     int 21h
     
     jmp input 
      
end_input:
         
     mov ah, 2
     mov dl, 0Dh
     int 21h    
     
     mov dl, 0Ah
     int 21h
            
     mov cx, 4
     
     
     
output:
    
    mov dl, bh
    
    shr dl, 4
    
    cmp dl, 10
    jl task3
    
    add dl, 55
    int 21h
    jmp task4
    
task3:
    
    add dl, 48
    int 21h
    
task4:
        
     rol bx, 4
     
     loop output
     
    
           
ret
