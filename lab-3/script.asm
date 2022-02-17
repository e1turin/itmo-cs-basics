org 0x569
X1: word 0x057e                             ;569
X2: word 0xa000                             ;56a
X3: word 0xe000                             ;56b
X4: word 0x0200                             ;56c
START:
    cla         ;               ;           ;56d
    st   X4     ;st   (IP-3)    ;           ;56e
    ld   #0x04  ;               ;           ;56f
    st   X3     ;st   (IP-6)    ;           ;570
    ld   X1     ;ld   (IP-9)    ;           ;571
    st   X2     ;st   (IP-9)    ;           ;572
LP: 
    ld   (X2)+  ;ld   (IP-A)+   ;           ;573
    ror         ;               ;           ;574
    bhis IJ     ;blo IP+1+5     ;           ;575
    ror         ;               ;           ;576
    bhis IJ     ;blo  IP+1+3    ;           ;577
    rol         ;               ;           ;578
    rol         ;               ;           ;579
    sub  (X4)+  ;sub  (IP-F)+   ;           ;57a
IJ: loop 0x56b  ;               ;           ;57b
    jump LP     ;br   IP-A      ;           ;57c
    hlt         ;               ;           ;57d
Y1: word 0x0100                             ;57e
Y2: word 0x0683                             ;57f
Y3: word 0x0c00                             ;580
Y4: word 0xf200                             ;581





