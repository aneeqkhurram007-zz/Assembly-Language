dosseg
.model small
.stack 100h
.data
;variables definition
.code

mov ax, @data
mov ds, ax



main PROC

mov cx, 10
mov dl, 48
mov ah, 2

Repeat:

int 21h
inc dl


Loop Repeat   

main ENDP

mov ah, 4ch
int 21h

end main