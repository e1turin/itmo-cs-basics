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

_MUL:
    cla
    st &-1          ;temp res
    st &-2          ;res sign
    ld &2
    bpl PLUS1       ;arg1>0
    neg
    st &2
    ld &-2
    not
    st &-2
    PLUS1:
    ld &1
    bpl MULLOOP     ;arg2>0
    neg
    st &1
    ld &-2
    not
    st &-2
    MULLOOP:
        ld &1       ;arg2
        beq BREAK   ;multiply by zero
        asr
        st &1
        bcc ODD
        ld &-1
        add &2
        st &-1
        ODD:
        ld &2       ;arg1*2
        asl
        st &2
        jump MULLOOP
    BREAK:
    ld &-2
    bpl PLUSRES     ;change result sign
    ld &-1
    neg
    br ENDMUL
    PLUSRES:
    ld &-1
    ENDMUL:
jump GOBACK

_SUB:
    ld &2           ;arg1
    sub &1          ;-arg2
jump GOBACK

START:
;{
    ;{
        ld #2
            push 
        ld #3
            push 
    ;}
    call _ADD
    ;{
        ld #7
            push 
        ld #5
            push 
    ;}
    call _SUB
;}
call _MUL
hlt
