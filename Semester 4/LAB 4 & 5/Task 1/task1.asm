;part f Arrays
.model small  

.stack 100h

.data
     
     Array DB 031h,032h,033h,034h,035h  
     
     a db 6
     b db 7
     c db 8
     
.code                  

main proc
        
        mov ax, @data
        mov ds, ax   
        
        mov ah, 2
        
        mov dl, Array+0
        
        int 21h
        
main endp  

        mov ah, 4ch
        int 21h

end main