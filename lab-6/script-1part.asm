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
	nop		        ;debug
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
