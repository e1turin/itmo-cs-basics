org     0x0a5
cla
st      VAR     ;ip+19  ;VAR=0   
ld      X       ;ip+17   
inc                     ;
push                    ;
call    $FUNC    ;0x669  ;
pop                     ;
add     VAR     ;ip+13  ;
st      VAR     ;ip+12  ;VAR+=f(X+1)

ld      Y       ;ip+f   ; 
dec                     ;
push                    ;
call    $FUNC    ;0x669  ;
pop                     ;
dec                     ;
add     VAR     ;ip+b   ;
st      VAR     ;ip+a   ;VAR+=f(Y-1)-1

ld      Z       ;ip+6   ;
push                    ;
call    FUNC    ;0x669  ;
pop                     ;
add     VAR     ;ip+5   ;
st      VAR     ;ip+4   ;VAR+=f(Z)

hlt

Z:      word    0xZZZZ
Y:      word    0xYYYY
X:      word    0xXXXX
VAR:    word    0x1f3f  ;=0


;--------------------------------------------
;f(x): 
;   if x<0: 
;       x<<=2   #x*=4
;       x+=VAL2 #0b 0000.0000.0010.1110=46
;   elif  x<=VAL1:
;       x=VAL1  #0b 0000.1111.1000.1000=3976
;   elif  x>VAL1: 
;       x<<=2   #x*=4
;       x+=VAL2 #0b 0000.0000.0010.1110=46
;   return x
;---------------------------------------------
org 0x669
FUNC:   
ld      &1              ;sp+1   ;ld arg
bmi     NGTV            ;ip+3    
cmp     VAL1            ;ip+9    
beq     LTEQ            ;ip+5    
blt     LTEQ            ;ip+4    
          
NGTV:
asl       
asl       
add     VAL2            ;ip+5    
br      END             ;ip+1    
          
LTEQ:       
ld      VAL1            ;ip+2    

END:     
st      &1              ;sp+1
ret

VAL1:   word    0x0f8b
VAL2:   word    0x002e


