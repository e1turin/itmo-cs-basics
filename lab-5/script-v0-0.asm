org	        0x5d2	        
endchar:	word	0x0a	;'\n' => stop
mask:	    word	0x00ff	;mask for 1 char

str:	    word	0x562	;str[0]
str.len:	word	0x0	    ;lenght of str
str.iter:	word	0x0	    ;pointer on str char
char:	    word	0x0	    ;char variable

START:		       
ld  $str	     
st	$str.iter	            ;str.iter -> str[0]

_readstr:                   ;str read loop	
    cla
    call    _readchar	
    st	    $char	
    ld	    $str.len	
    inc		
    st	    $str.len	
    ror		            
    bcc	    _oddpos         ;char position is odd	
    ld	    $char	    
    st	    (str.iter)	
    jump	_is_end	
    _oddpos:	
    ld	    $char
    swab		
    add	    (str.iter)	
    st	    (str.iter)+	
    _is_end:                ;check for end of input	
    ld	    $char
    cmp	    endchar	
    bne	    _readstr	

ld	    $str	
st	    $str.iter           ;str.iter := str[0]	

_printstr:	                ;str print loop 
    ld	    (str.iter)      ;first byte	
    call	_writechar	
    ld      (str.iter)
    and     mask	
    cmp     endchar	
    beq     __stop	
    
    ld      (str.iter)      ;second byte
    swab		
    call	_writechar	
    ld      (str.iter)+
    swab		
    and     mask	
    cmp     endchar	
    bne     _printstr	
__stop:	
hlt

_readchar:                  ;read char from dev-3	
    in      7	    
    and     #0x40	
    beq     _readchar	
    in      6	
    and     mask	
    ret		

_writechar:                 ;write char to dev-5
    out     0xc	
    _waitwrote:	
    in	    0xe	
    ror		
    bcs	    _waitwrote	
    ret		
