dosseg
.model small
.stack 100h
.data
;variables 
.code
Main proc

	     mov dl, 'a'
	     mov ah, dl
	     mov ah, 2
	     int 21h

	     mov ah, 4ch
	     int 21h

Main endp
end Main