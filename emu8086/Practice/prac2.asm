.model small
.stack 100h
.data
.code
main proc
 
 mov cx, 148
 mov ax, 0
    
label1:
cmp cx, 0  
jle stop
add ax, cx
sub cx, 2

loop label1
 
 stop:
 mov dx, ax
 mov ah, 4ch
 int 21h
    
main endp
end main