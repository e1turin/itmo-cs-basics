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
