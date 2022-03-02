org 0x000
SIZE: word 0x0004    
CNTR: word 0x0000    
START:
_loop: 
    ld   Y0     
    and  #0x0003      
    bne  _endl        
    cmp  (CNTR)+     
_endl: 
    cmp  (_loop)+
    loop SIZE       
    jump _loop       
    hlt              
Y0: word 0x0100      
    word 0x0683      
    word 0x0c00      
    word 0xf200      
