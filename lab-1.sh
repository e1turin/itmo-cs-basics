
#!/bin/bash

# Variables
lab0=./lab0

alakazam3=./lab0/alakazam3 #file
cacturne3=./lab0/cacturne3 #file

feraligatr5=./lab0/feraligatr5 
swablu=./lab0/feraligatr5/swablu
dwebble=./lab0/feraligatr5/dwebble
floatzel=./lab0/feraligatr5/floatzel #file
dragonair=./lab0/feraligatr5/dragonair
fraxure=./lab0/feraligatr5/fraxure #file


phanpy0=./lab0/phanpy0
archeops=./lab0/phanpy0/archeops #file
hypno=./lab0/phanpy0/hypno #file
bronzor=./lab0/phanpy0/bronzor #file
clefairy=./lab0/phanpy0/clefairy

swalot4=./lab0/swalot4 #file

vigoroth=./lab0/vigoroth7
taillow=./lab0/vigoroth7/taillow #file
prinplup=./lab0/vigoroth7/prinplup
armaldo=./lab0/vigoroth7/armaldo
tynamo=./lab0/vigoroth7/tynamo

########

mkdir $lab0 

    touch $alakazam3   
    touch $cacturne3   

    mkdir $feraligatr5 
        mkdir $swablu      
        mkdir $dwebble     
        touch $floatzel    
        mkdir $dragonair   
        touch $fraxure     


    mkdir $phanpy0     
        touch $archeops    
        touch $hypno       
        touch $bronzor     
        mkdir $clefairy    

    touch $swalot4     

    mkdir $vigoroth    
        touch $taillow     
        mkdir $prinplup    
        mkdir $armaldo     
        mkdir $tynamo

#########

#touch ./lab0/alakazam3
echo "saltk=14 sdef=9 spd=12" >> $alakazam3

#touch ./lab0/cacturne3
cat > $cacturne3 << EOF
Тип диеты
Phototroph
EOF

#touch ./lab0/feraligatr5/floatzel
cat > $floatzel << EOF
Развитые способности Water Veil
EOF

#touch ./lab0/feraligatr5/fraxure
cat > $fraxure << EOF
Тип
покемона  DRAGON NONE
EOF

#touch ./lab0/phanpy0/archeops
echo "Живет Mountain" >> $archeops

#touch ./lab0/phanpy0/hypno
printf "Возможности\nOverland=8 Surface=5 Jump=3 Power=3 Intelligence=5 Dream Smoke=0 Mind\nLock=0" >> $hypno

#touch ./lab0/phanpy0/bronzor
printf "Rollout Signal Beam Skill Swap Sleep Talk Snore Stealth Rock Trick\nWonder Room" $bronzor

#touch .lab0/swalot4
printf "Способности Venom Sticky Hold Liquid\nOoze" >> $swalot4

#touch ./lab0/vigoroth7/taillow
echo "weight=5.1 height=12.0 atk=6 def=3" >> $taillow

##########

#chmod 006 ./lab0/alakazam3
#chmod uo-rwx,g=rw ./lab0/cacturne3 
#chmod feraligatr5 
