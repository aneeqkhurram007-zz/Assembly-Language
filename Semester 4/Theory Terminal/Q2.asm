.MODEL SMALL
.STACK 100H

.DATA
N DW 0
VALN DW 0
F1 DW 0
F2 DW 2          
NUMBER DB 5 DUP(?)    
PROMPT_1 DW 0Dh, 0Ah' THE GIVEN SEQUENCE IS:  $'
PROMPT_2 DW 0Dh, 0Ah, 'THE NTH TERM IS : $'

.CODE  

MOV AX, @DATA
MOV DS, AX
  
PRINTCHAR MACRO N1 
    
    PUSH AX
    PUSH DX
    
    MOV DH, 0
    MOV DL, N1
    MOV AH, 2
    INT 21H
    
    POP DX
    POP AX

PRINTCHAR ENDM    


PRINTVALN MACRO N1

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV AX, N1
    
    LEA SI, NUMBER
    
    MOV BX, 10            
    XOR CX, CX
    LOCAL DIVIDE
    DIVIDE:
    
    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    
    JNE DIVIDE
    LOCAL STORE
    STORE:
    
    POP DX
    ADD DL, 30H
    MOV [SI], DL
    INC SI
    
    LOOP STORE
    
    MOV [SI], '$'
    
    LEA DX, NUMBER          
    MOV AH, 9
    INT 21H
    
    POP DX
    POP CX
    POP BX
    POP AX

PRINTVALN ENDM    
 

MAIN PROC

    MOV VALN, 10
    DEC VALN
    MOV F1, 3
    
    MOV DX, OFFSET PROMPT_1
    MOV AH, 9
    INT 21H
    
    PRINTVALN F1
    
    PRINTCHAR ','
    
    CALL SERIES
    L1:
        
            
        MOV DX, OFFSET PROMPT_2
        MOV AH, 9
        INT 21H
        
        
        PRINTVALN F1
        
           
    RET    
    
MAIN ENDP
    
    
SERIES PROC

    MOV AX, VALN
    MOV N, AX
    
    CMP N, 0
    JNE AGAIN
    
    JMP EXIT
    
    AGAIN:
    
        DEC VALN
        
        CALL SERIES
    
    L2:
        MOV AX, F1
        ADD AX, F2
        MOV F1, AX
        INC F2
        INC F2   
        
        PRINTVALN F1
        
        PRINTCHAR ','
            
    EXIT:
    
SERIES ENDP

RET