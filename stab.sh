#!/bin/bash
MYMAC=$(env | grep SSH_CONN | awk '{print$1}' | awk -F= '{print$2}')
for i in `seq 2 $(($(screen -list | wc -l) -2))`
 do
    echo -ne $((i-1))
    screen -list | sed -n ''$i'p'
 done
echo -n "What screen session would you like to open? (type \"new\" for a new session): "
read choice
if [ "$choice" = "south-lpars" ]
then
    screen -c ~/.screenrc-c3270-south -S south-lpars
    exit
fi
if [ "$choice" = "east-lpars" ]
then
    screen -c ~/.screenrc-c3270-east -S east-lpars
    exit
fi
if [ "$choice" = "north-lpars" ]
then
    screen -c ~/.screenrc-c3270-north -S north-lpars
    exit
fi
if [ "$choice" = "quit" ] || [ "$choice" = "q" ]
then
    exit
fi
if [ "$choice" != "new" ]
then
    screen -DD -R $(screen -list | sed -n ''$((choice + 1))'p' | awk -F. '{ print $1 }')
else
    echo -n "What would you like to call this new screen session?: "
    read name
    screen -S $name
fi 
