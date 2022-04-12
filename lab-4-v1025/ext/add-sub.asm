org 0x010

_ADD:
    ld &1       ;arg1
    add &2      ;+arg2
GOBACK:         ;moves AC to arg1 position, erases ret address, return to script
    st &2
    ld &0
    st &1
    pop
    ret

_SUB:
    ld &2           ;arg1
    sub &1          ;-arg2
jump GOBACK
