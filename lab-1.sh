#!/bin/bash


# Task 1 

## Variables
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

vigoroth7=./lab0/vigoroth7
taillow=./lab0/vigoroth7/taillow #file
prinplup=./lab0/vigoroth7/prinplup
armaldo=./lab0/vigoroth7/armaldo
tynamo=./lab0/vigoroth7/tynamo

# Creating dir tree

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

    mkdir $vigoroth7
        touch $taillow     
        mkdir $prinplup    
        mkdir $armaldo     
        mkdir $tynamo

# Filling files

echo "saltk=14 sdef=9 spd=12" >> $alakazam3

cat > $cacturne3 << EOF
Тип диеты
Phototroph
EOF

cat > $floatzel << EOF
Развитые способности Water Veil
EOF

cat > $fraxure << EOF
Тип
покемона  DRAGON NONE
EOF

echo "Живет Mountain" >> $archeops

printf "Возможности\nOverland=8 Surface=5 Jump=3 Power=3 Intelligence=5 Dream Smoke=0 Mind\nLock=0" >> $hypno

printf "Rollout Signal Beam Skill Swap Sleep Talk Snore Stealth Rock Trick\nWonder Room" >> $bronzor

printf "Способности Venom Sticky Hold Liquid\nOoze" >> $swalot4

echo "weight=5.1 height=12.0 atk=6 def=3" >> $taillow


# Task 2

## Changing permissions

chmod 006 $alakazam3 
chmod a-rwx,g+rw $cacturne3
chmod 357 $feraligatr5
chmod 361 $swablu
chmod 551 $dwebble
chmod 604 $floatzel
chmod 551 $dragonair
chmod 004 $fraxure
chmod 524 $phanpy0
chmod u-rwx,g=r,o=rw $archeops
chmod 640 $hypno
chmod 404 $bronzor
chmod 317 $clefairy
chmod ug-rwx,o=rw $swalot4
chmod 736 $vigoroth7
chmod 400 $taillow
chmod 357 $prinplup
chmod 737 $armaldo
chmod 341 $tynamo


# Task 3

## Copy recursively $phanpy0 to $phanpy/clefairy




## Merge $archeops & $bronzor into $lab0/alakazam3_27

## Create symlink for $cacturne3 named $phanpy0/bronzorcacturne

## Copy $cacturne3 to new $phanpy0/bronzorcacturne

## Copy $cacturne3 to $prinplup

## Create hardlink for $cacturne3 named $feraligatr5/fraxurecacturne

## Create symlink for $feraligatr5 in $lab0/Copy_30


# Task 4

