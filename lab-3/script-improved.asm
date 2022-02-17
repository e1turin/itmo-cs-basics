org 0x569
X1: word 0x057e ;=Y0                        ;569
X2: word 0xa000 ;=X1=Y0                     ;56a
X3: word 0xe000 ;=0004  loops               ;56b
X4: word 0x0200 ;=0000  cntr                ;56c
START:
    cla         ;               ;           ;56d
    st   X4     ;               ;           ;56e
    ld   #0x04  ;               ;           ;56f
    st   X3     ;               ;           ;570
    ld   X1     ;               ;           ;571
    st   X2     ;               ;           ;572
LP: 
    ld   (X2)+  ; for Yi        ;           ;573
    ror         ; Yi mod 2      ;           ;574
    bhis IJ     ; if C=1-> IJ   ;           ;575
    ror         ; Yi mod 2      ;           ;576
    bhis IJ     ; if C=1-> IJ   ;           ;577
    rol         ; Yi *= 2       ;           ;578
    rol         ; Yi *= 2       ;           ;579
    sub  (X4)+  ; Yi-i          ;           ;57a
IJ: loop 0x56b  ; for 4 times   ;           ;57b
    jump LP     ;               ;           ;57c
    hlt         ;               ;           ;57d
Y0: word 0x0100                             ;57e
Y1: word 0x0683                             ;57f
Y2: word 0x0c00                             ;580
Y3: word 0xf200                             ;581
