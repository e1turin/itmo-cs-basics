
START:
    ld #2
    push 
    ld #3
    push 
    call _ADD

    ld #7
    push 
    ld #5
    push 
    call _SUB
call _MUL
hlt
