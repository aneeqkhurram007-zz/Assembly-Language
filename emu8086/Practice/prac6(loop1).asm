mov cx, 5
mov ah, 2

parent:
cmp cx, 5


mov bx, 0

child:
cmp bx, cx
jge child_end

mov dl, '*'
int 21h
inc bx

jmp child
child_end:

mov dl, 10
int 21h

mov dl, 13
int 21h



loop parent
parent_end:
mov ah, 4ch
int 21h