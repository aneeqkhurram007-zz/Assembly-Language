.model small
.stack 100h
.data
msg1 db 'Aneeq Khurram$'
.code


main proc
  
  mov ax, @data
mov ds, ax

  
mov ah, 9
lea dx, msg1
int 21h

    
main endp

mov ah, 4ch
int 21h

end main