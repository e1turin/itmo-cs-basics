org     0x075
START:
cla
st      VAR     ;VAR=0
ld      Y       ;
inc             ;
push            ;
call    $FUNC   ;
pop             ;
add     VAR     ;
st      VAR     ;VAR+=f(y+1)
ld      X       ;
push            ;
call    $FUNC   ;
pop             ;
inc             ;
add     VAR     ;
st      VAR     ;VAR+=f(x)+1
ld      Z       ;
push            ;
call    $FUNC   ;
pop             ;
dec             ;
add     VAR     ;
st      VAR     ;VAR+=f(z)-1
hlt
Z:      word    0xZZZZ ;0xffff
Y:      word    0xYYYY ;0x00b8
X:      word    0xXXXX ;0x00aa
VAR:    word    0x023e  ;:0x090
org 0x694
FUNC:               ;f(x)
ld      &1          ;
bmi     LTEQZVL1    ;
beq     LTEQZVL1    ;if(x<=0||x>208): return x*3+183
cmp     VAL1        ;    
beq     LTEQVAL1    ;
blt     LTEQVAL1    ;if(x<=208): return 208    
LTEQZVL1:             
add     &1          
add     &1          
add     VAL2        
br      STOP        
LTEQVAL1: 
ld      VAL1       
STOP: 
st      &1
ret
VAL1:   word    0x00d0  ;=208
VAL2:   word    0x00b7  ;=183



