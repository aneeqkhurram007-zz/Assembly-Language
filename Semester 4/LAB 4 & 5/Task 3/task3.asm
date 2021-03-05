;part f Arrays
.model small  

.stack 100h

.data
     
 
     
     a db 6
     b db 7
     c db 8
     
.code                  

main proc
        
        mov ax, @data
        mov ds, ax   
        
        mov ah, 2
       
       ;part a 
      ;mov dl, a
      ;sub b, dl
      ;mov dl, b
      ;mov a, dl
       
       ;part b
      ;mov dl, a
      ;add dl, 1
      ;neg dl
      ;mov a, dl  
      
       ;part c
      ;mov dl, a
      ;add dl, b
      ;mov c, dl  
      
       ;part d
      ;mov dl, b
      ;add dl, b
      ;add dl, b
      ;add dl, 7
      ;mov b, dl

       ;part e
       
      ;dec a
      ;mov dl, a
      ;sub b, dl
      ;mov dl,b
      ;mov a, dl



        int 21h
        
main endp  

        mov ah, 4ch
        int 21h

end main