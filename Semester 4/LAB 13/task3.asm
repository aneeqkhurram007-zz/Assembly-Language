.model small
.stack 100h
.data
str1 db 10h,15h
str2 db 20h,25h
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    lea si, str1
    lea di, str2
    mov ax, 4142h
   movsb
   movsw
   stosb
   stosw
   lodsb
   lodsw
        
        mov ah, 4ch
        int 21h
main endp
end main