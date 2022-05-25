org 0x000
v0:     word    $default,   0x180
v1:     word    $default,   0x180
v2:     word    $int2,      0x180
v3:     word    $int3,      0x180
v4:     word    $default,   0x180
v5:     word    $default,   0x180
v6:     word    $default,   0x180
v7:     word    $default,   0x180
org 0x015
x:      word    ?
uplim:  word    0x002a
lowlim: word    0xffd5
default:
    iret

int2:
	nop		;debug
	cla		
	in	    0x4	    ;dev-2
    sxtb
    push
    asl 
    add     &0
	add	    x	
	call	_check	
	st	    x	
    pop
    ld      x       ;to see in AC
    nop		        ;debug
	iret		

int3:
	nop		        ;debug
	ld	    x	
	asl		        ;f(x)=3x+1
	add	    x	
    inc
	out	    0x6     ;dev-3	
	nop		        ;debug
	iret		

_check:
    cmp uplim
    bpl _setmax
    cmp lowlim
    bmi _setmax
_retcheck:
    ret
_setmax:
    ld uplim
    jump _retcheck

START:
	di		
	cla		
	out	    0x1	    ;deny interruptions
	out	    0x3	
	out     0xb	
	out     0xf	
	out     0x13	
	out     0x17	
	out     0x1b	
	out     0x1f	
	ld      #0xa	;mr dev-2 (1000|0010)
	out     0x5	    
	ld      #0xb	;mr dev-3 (1000|0013)
	out     0x7	    
	ei		

main:
	di		
	ld	    x	
	sub     #2		    
	call	_check
	st	    x	
	ei		
	nop		
	jump	main	

