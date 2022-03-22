org     0x075
START:
cla
st      VAR     ;ip+19   
ld      Y       ;ip+16   
inc           
push         
call    $FUNC   ;0x694   
pop          
add     VAR     ;ip+13   
st      VAR     ;ip+12   
ld      X       ;ip+10   
push         
call    $FUNC   ;0x694   
pop          
inc          
add     VAR     ;ip+c    
st      VAR     ;ip+b    
ld      Z       ;ip+7    
push         
call    $FUNC
pop          
dec          
add     VAR     ;ip+5    
st      VAR     ;ip+4    
hlt
Z:      word    0xZZZZ
Y:      word    0xYYYY
X:      word    0xXXXX
VAR:    word    0x023e


org 0x694
FUNC:               ;f(x)
ld      &1          ;=x
bmi     LTEQZVL2    ;if(x<0): LTEQZVL2(x)
beq     LTEQZVL2    ;if(x==0): LTEQZVL2(x)    
cmp     VAL1        ;    
beq     LTEQVAL2    ;if(x==183): LTEQVAL2(x)    
blt     LTEQVAL2    ;if(x<183): LTEQVAL2(x)    
                    ;if(x>183): LTEQZVL2(x)
LTEQZVL2:             
add     &1          ;x+=x
add     &1          ;x+=x
add     VAL2        ;x+=183
br      STOP        ;

LTEQVAL2: 
ld      VAL1        ;x=208    

STOP: 
st      &1
ret

VAL1:   word    0x00d0  ;=208
VAL2:   word    0x00b7  ;=183



