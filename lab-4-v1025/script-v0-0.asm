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
call    0x694
pop          
dec          
add     VAR     ;ip+5    
st      VAR     ;ip+4    
hlt
Z:      word    0xZZZZ
Y:      word    0xYYYY
X:      word    0xXXXX
VAR:    word    0x023e


