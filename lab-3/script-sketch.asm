org 0x569
X1: word 0x057e                             ;569
X2: word 0xa000                             ;56a
X3: word 0xe000                             ;56b
X4: word 0x0200                             ;56c
START:
    cla         ;           ;               ;56d
    word 0xeefd ;st   X4    ;st   (IP-3)    ;56e
    word 0xaf04 ;ld   #0x04 ;               ;56f
    word 0xeefa ;st   X3    ;st   (IP-6)    ;570
    word 0xaef7 ;ld   X1    ;ld   (IP-9)    ;571
    word 0xeef7 ;st   X2    ;st   (IP-9)    ;572
LP: word 0xaaf6 ;ld   (X2)+ ;ld   (IP-A)+   ;573
    ror         ;           ;               ;574
    word 0xf480 ;bhis       ;blo  IP+1-FF   ;575
    ror         ;           ;               ;576
    word 0xf403 ;bhis IJ    ;blo  IP+1+3    ;577
    rol         ;           ;               ;578
    rol         ;           ;               ;579
    word 0x6af1 ;sub  (X4)+ ;sub  (IP-F)+   ;57a
IJ: loop 0x56b  ;           ;               ;57b
    word 0xcef6 ;jump LP    ;br   IP-A      ;57c
    hlt         ;           ;               ;57d
    word 0x0100                             ;57e
    word 0x0683                             ;57f
    word 0x0c00                             ;580
    word 0xf200                             ;581





