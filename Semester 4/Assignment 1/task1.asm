;Question 1
.model small
.stack 100h
.data   
    
   num1 db ?
   num2 db ?
   num3 db ?
   str1 db "THE SUM OF $"
   str2 db " AND $"
   str3 db " IS $"
    
.code
main proc 
    
     mov ax, @data
     mov ds, ax
     
     ;part a display a "?"
     mov ah,2
     mov dl, '?'
     int 21h              
     
     ;part b display digits whose sum is less than 10,
     mov ah,1
     
     int 21h
     
     mov num1,al
     ;add num1,48
     
     int 21h
     ;add al,48
     mov num2,al
     
     add al,num1
     
     mov dl,al
     sub dl,48
     mov num3, dl
             
     mov ah,2
     mov dl,0Ah
     int 21h
     
     mov dl,0Dh
     int 21h
                          
     mov ah,9
     
     lea dx,str1
     
     int 21h
     
     mov ah, 2 
     mov dl, num1
     int 21h
              
     mov ah,9
     
     lea dx,str2
     
     int 21h
         
     mov ah,2         
     mov dl, num2
     int 21h


     mov ah,9
     
     lea dx,str3
     
     int 21h
     
     mov ah,2
     mov dl, num3
     int 21h


     
    
main endp  

    mov ah, 4ch
    int 21h
end main