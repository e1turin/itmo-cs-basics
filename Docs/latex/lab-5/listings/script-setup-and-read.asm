org	        0x5d2	        
endchar:	word	0x0a	
mask:	    word	0x00ff	

str:	    word	0x562	
str.len:	word	0x0	    
str.iter:	word	0x0	    
char:	    word	0x0	    

START:		       
ld  $str	     
st	$str.iter	            

_readstr:                   
    cla
    call    _readchar	
    st	    $char	
    ld	    $str.len	
    inc		
    st	    $str.len	
    ror		            
    bcc	    _oddpos         
    ld	    $char	    
    st	    (str.iter)	
    jump	_is_end	
    _oddpos:	
    ld	    $char
    swab		
    add	    (str.iter)	
    st	    (str.iter)+	
    _is_end:                
    ld	    $char
    cmp	    endchar	
    bne	    _readstr	

ld	    $str	
st	    $str.iter           

