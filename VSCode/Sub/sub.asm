dosseg
.model small
.stack 100h
.data
.code
;Subtract two number
main PROC

mov ah, 1
int 21h

mov bl, al

int 21h
add bl, al

sub bl, 48

mov ah, 2
mov dl, bl
int 21h

mov ah, 4ch
int 21h

main ENDP

end main