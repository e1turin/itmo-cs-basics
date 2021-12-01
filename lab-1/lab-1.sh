#!/bin/bash

# TASK 1 

## Variables
curr=. # on producton it is ~/
lab0=$curr/lab0

alakazam3=$lab0/alakazam3 #file
cacturne3=$lab0/cacturne3 #file

feraligatr5=$lab0/feraligatr5 
    swablu=$feraligatr5/swablu
    dwebble=$feraligatr5/dwebble
    floatzel=$feraligatr5/floatzel #file
    dragonair=$feraligatr5/dragonair
    fraxure=$feraligatr5/fraxure #file

phanpy0=$lab0/phanpy0
    archeops=$phanpy0/archeops #file
    hypno=$phanpy0/hypno #file
    bronzor=$phanpy0/bronzor #file
    clefairy=$phanpy0/clefairy

swalot4=$lab0/swalot4 #file

vigoroth7=$lab0/vigoroth7
    taillow=$vigoroth7/taillow #file
    prinplup=$vigoroth7/prinplup
    armaldo=$vigoroth7/armaldo
    tynamo=$vigoroth7/tynamo


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


# TASK 2

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

sudo tree $lab0 > task2tree.txt

# TASK 3

## Copy recursively $phanpy0 to $phanpy0/clefairy

chmod u+r $clefairy $archeops
cp -rp $phanpy0 $lab0/phanpy0_tmp
chmod u+w $phanpy0 $lab0/phanpy0_tmp
mv $lab0/phanpy0_tmp $clefairy/phanpy0
chmod u-r $clefairy
#chmod u-r $archeops # will do it later
chmod u-w $clefairy/phanpy0
#chmod u-w $phanpy0 # will do it later


## Merge $archeops & $bronzor into $lab0/alakazam3_27

cat $archeops $bronzor > $lab0/alakazam3_27
chmod u-r $archeops 


## Create symlink for $cacturne3 named $phanpy0/bronzorcacturne

chmod u+r $cacturne3 
ln -s -T ../cacturne3 $phanpy0/bronzorcacturne
#chmod u-r $cacturne3
#chmod u-w $phanpy0 # will do it later


## Copy $cacturne3 to new $phanpy0/bronzorcacturne

cp $cacturne3 $phanpy0/bronzorcacturne 2>/dev/null | true 
#chmod u-r $cacturne3 # will do it later
chmod u-w $phanpy0


## Copy $cacturne3 to $prinplup

cp $cacturne3 $prinplup
#chmod u-r $cacturne3 # will do it later


## Create hardlink for $cacturne3 named $feraligatr5/fraxurecacturne

ln $cacturne3 $feraligatr5/fraxurecacturne 
chmod u-r $cacturne3


## Create symlink for $feraligatr5 in $lab0/Copy_30

ln -s -T ./feraligatr5 $lab0/Copy_30

ls -lR $lab0
echo "here"
sudo tree $lab0 > task3tree.txt

# TASK 4

## Count lines of files: floatzel, fraxure, archeops, hypno, bronzor, write the result to a file in the /tmp directory, redirect access errors to a file in the /tmp directory

#chmod u+r $feraligatr5
wc -l $floatzel > /tmp/floatzel_len 2> /tmp/err.log
wc -l $fraxure  > /tmp/fraxure_len  2>>/tmp/err.log
wc -l $archeops > /tmp/archeops_len 2>>/tmp/err.log
wc -l $hypno    > /tmp/hypno_len    2>>/tmp/err.log
wc -l $bronzor  > /tmp/bronzor_len  2>>/tmp/err.log


## Print the last three elements of the recursive list of names and attributes of files in the lab0 directory, starting with the character 't', sort the list in ascending order by the number of hard links, add the output of access errors to the standard output

# TODO: delete 2>/dev/null
ls -lR $lab0 | grep --extended-regexp "^[-dl][-rwx]{7}.* t.*$" | tail -n 3 | sort --key=2n


## Print the contents of the cacturne3 file with line numbers, exclude lines ending in 'd', ignore case, add access error output to standard output

#TODO: delete 2>/dev/null
cat -n $cacturne3  | grep -vi "d$"


## List the filenames in the feraligatr5 directory, sort the list by name a-> z, do not suppress or redirect access errors

#TODO: delete 2>/dev/null
ls -1 $feraligatr5 | sort 


## Output recursively a list of names and attributes of files in the lab0 directory containing the string "swa", sort the list in descending order of the date of access to the file, suppress the output of access errors
 
ls -lRtr $lab0 2>/dev/null | grep --extended-regexp "[-dlr][-rwx]{7}.*swa.*" 


## Print recursively a list of names and attributes of files in the lab0 directory ending with the 'r' character, sort the list in ascending order of the access date to the file, redirect access errors to a file in the / tmp directory

#TODO: change to /tmp/err.log
ls -lRt $lab0 2>/tmp/err.log | grep "r$" 

sudo tree $lab0 > task4tree.txt

# TASK 5
:
## Delete file cacturne3 

chmod u+w $cacturne3
rm $cacturne3


## Delete file lab0 / phanpy0 / hypno

chmod u+w $phanpy0
rm $hypno


## remove symbolic links Copy_ *

rm $lab0/Copy_*


## remove hard links lab0 / feraligatr5 / fraxurecactur *

rm $feraligatr5/fraxurecactur


## Delete directory feraligatr5

chmod u+r $feraligatr5
rm -rf $feraligatr5

## Delete directory lab0 / feraligatr5 / swablu

chmod -R u+rw $lab0
rm -rf $lab0

echo "no lab0"
