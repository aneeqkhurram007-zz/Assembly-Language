.model small
.stack 100
.data
msg1 db 'Enter string 1: $'
msg2 db 0Ah,0Dh,'Enter string 2: $'
arr1 db 10 dup('$')
arr2 db 10 dup('$')
msg3 db 0Ah,0Dh,'Both are identical.$'
msg4 db 0Ah,0Dh,'Both are not identical.$'
msg5 db 0Ah,0Dh,'String 1 is longer. $'
msg6 db 0Ah,0Dh,'String 2 is longer. $'
counter1 db 0
counter2 db 0 
.code
main proc
    
     mov ax, @data
     mov ds, ax
     
     mov ah, 9
     lea dx, msg1
     int 21h
     
     lea si, arr1
     
     mov ah, 1
     int 21h
     
     while:
     
        mov [si], al
        cmp al, 0Dh
        je exit
        
        inc si
        inc counter1
        
        int 21h
        jmp while
        
        
      exit:  
        
        
      mov ah, 9
      lea dx, msg2
      int 21h
      
      lea si, arr2
      
      mov ah, 1
      int 21h  
      
        while2:
     
        mov [si], al
        cmp al, 0Dh
        je exit2
        
        inc si
        inc counter2
        
        int 21h
        jmp while2
        
        
      exit2:  
      
      mov dl, counter1
      
      cmp dl, counter2
      
      jg str1
      
      str2:
      mov ah, 9
      lea dx, msg6
      int 21h
      
      mov ah, 4ch
      int 21h
      
     str1:
     mov ah, 9
     lea dx, msg5
     int 21h 
     
     mov ah, 4ch
     int 21h
     
main endp
end main