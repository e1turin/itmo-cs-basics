org     0x0a5

cla
st      VAR     ;VAR=0   

ld      X       ;
inc             ;
push            ;
call    $FUNC   ;
pop             ;
add     VAR     ;
st      VAR     ;VAR+=f(X+1)

ld      Y       ; 
dec             ;
push            ;
call    $FUNC   ;
pop             ;
dec             ;
add     VAR     ;
st      VAR     ;VAR+=f(Y-1)-1

ld      Z       ;
push            ;
call    $FUNC   ;
pop             ;
add     VAR     ;
st      VAR     ;VAR+=f(Z)

hlt

Z:      word    0x0001;0xZZZZ
Y:      word    0x0002;0xYYYY
X:      word    0x0003;0xXXXX
VAR:    word    0x1f3f  ;=0 ;0x0c0


;-------------- f(x) ---------------------
org 0x669
FUNC:
ld      &1      ;=x
bmi     NGTV    ;if(x<0): return NGTV(x)       
cmp     VAL1    ;
beq     LTEQ    ;
blt     LTEQ    ;if(x<=VAL1): return LTEQ(x)       
                ;if(x>VAL1): return NGTV(x)
NGTV:
asl             ;
asl             ;
add     VAL2    ;       
br      STOP    ;return x*4+VAL2       
          
LTEQ:       
ld      VAL1    ;return VAL1

STOP:     
st      &1              
ret

VAL1:   word    0x0f8B  ;=3979
VAL2:   word    0x002e  ;=46


