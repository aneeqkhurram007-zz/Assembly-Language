.MODEL SMALL
.STACK 100h           
.DATA        
    VAR DW 1   
.CODE
MAIN PROC     
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 50
      
    MOV DX, VAR       
    TOP:     
    
    ADD DX, 4 
    
    LOOP TOP
     
    MOV VAR, DX 
        
    MOV AH, 4CH
    INT 21H  
MAIN ENDP         
END MAIN