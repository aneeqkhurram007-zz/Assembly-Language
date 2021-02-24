dosseg
.model small
.stack 100
.data
.code
main PROC
    mov bl, 3
    mov cl, 15
    add bl, cl
    add bl, 48
    mov dl, bl
    mov ah ,2
    int 21h

    mov ah, 4ch

main ENDP
end main