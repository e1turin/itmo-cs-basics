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
	ld      #0xa	;mr dev-2 (1000v0010)
	out     0x5	    
	ld      #0xb	;mr dev-3 (1000v0011)
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

