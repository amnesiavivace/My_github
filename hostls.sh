#!/bin/bash
# hi
HOSTS=''
t=''
function createlist() {
        s=`echo $t | tr '[A-Z]' '[a-z]' | sed  's/,/ /g' | sed 's/ and / /g'`
        for i in $s
            do  
                HOSTS=$HOSTS' '$i
            done
}
if [ -f "$1" ]  # list of servers in a file
    then #list file
        dos2unix -q $1
        t=`cat $1`
    else # multiple host arguments
        while [ $# -gt 0 ] # loop until no args left
            do
                t=$t' '$1   
                shift
            done
fi
createlist "$t"
echo $HOSTS
export HOSTS
