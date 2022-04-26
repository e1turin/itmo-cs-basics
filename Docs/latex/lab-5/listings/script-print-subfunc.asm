_printstr:	                
    ld	    (str.iter)      
    call	_writechar	
    ld      (str.iter)
    and     mask	
    cmp     endchar	
    beq     __stop	
    
    ld      (str.iter)      
    swab		
    call	_writechar	
    ld      (str.iter)+
    swab		
    and     mask	
    cmp     endchar	
    bne     _printstr	
__stop:	
hlt

_readchar:                  
    in      7	    
    and     #0x40	
    beq     _readchar	
    in      6	
    and     mask	
    ret		

_writechar:                 
    out     0xc	
    _waitwrote:	
    in	    0xe	
    ror		
    bcs	    _waitwrote	
    ret		
