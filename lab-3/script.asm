org 0x569
X1: word 0x057e ; = Y0 address              ;569
X2: word 0xa000 ; =X1 = Y0 address          ;56a
X3: word 0xe000 ; =0x0004 = times           ;56b
X4: word 0x0200 ; =0x0000 = counter         ;56c
START:
    cla         ;               ;           ;56d
    st   X4     ;st   (IP-3)    ;           ;56e
    ld   #0x04  ;               ;           ;56f
    st   X3     ;st   (IP-6)    ;           ;570
    ld   X1     ;ld   (IP-9)    ;           ;571
    st   X2     ;st   (IP-9)    ;           ;572
_LOOP: 
    ld   (X2)+  ;ld   (IP-A)+   ;           ;573
    ror         ;C=AC mod 2     ;           ;574
    bhis ENDLOP ;blo  IP+1+5    ;           ;575
    ror         ;C=AC mod 2     ;           ;576
    bhis ENDLOP ;blo  IP+1+3    ;           ;577
    rol         ;AC<<1+C        ;           ;578
    rol         ;AC<<1+C        ;           ;579
    sub  (X4)+  ;sub  (IP-F)+   ;           ;57a
ENDLOP: 
    loop $X3    ;loop 0x56b     ;           ;57b
    jump _LOOP  ;br   IP-A      ;           ;57c
    hlt         ;               ;           ;57d
Y1: word 0x0100                             ;57e
Y2: word 0x0683                             ;57f
Y3: word 0x0c00                             ;580
Y4: word 0xf200                             ;581





