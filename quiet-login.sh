#!/bin/bash

for h in $HOSTS; do
    tput sc
    echo -n "** $h                "
    ssh -o ConnectTimeout=1 -qt $h "PATH=$PATH:/usr/local/bin;$@"
    tput el1
    tput rc
done
echo "***"
echo "     FINISHED  ***"
