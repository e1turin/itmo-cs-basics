org     0x0a5
cla
st      X1      ;ip+19   
ld      X2      ;ip+17   
inc           
push          
call    FUNC    ;0x669   
pop          
add     X1      ;ip+13   
st      X1      ;ip+12   
ld      X3      ;ip+f    
dec           
push          
call    FUNC    ;0x669   
pop           
dec           
add     X1      ;ip+b    
st      X1      ;ip+a    
ld      X4      ;ip+6    
push          
call    FUNC    ;0x669   
pop           
add     X1      ;ip+5    
st      X1      ;ip+4    
hlt
X4:     word    0xZZZZ
X3:     word    0xYYYY
X2:     word    0xXXXX
X1:     word    0x1f3f

;---
org 0x669
FUNC:
ld      &1              ;sp+1   ;ld arg
bmi     NGTV            ;ip+3    
cmp     VAL1            ;ip+9    
beq     EQLS            ;ip+5    
blt     EQLS            ;ip+4    
          
NGTV:
asl       
asl       
add     VAL2            ;ip+5    
br      END             ;ip+1    
          
EQLS:       
ld      VAL1            ;ip+2    

END:     
st      &1              ;sp+1
ret

VAL1:   word    0x0f8b
VAL2:   word    0x002e


