#!/bin/bash

for h in $HOSTS; do
    echo "**v $h            "
    ssh -qt $h "$1"
#    ssh -o ConnectTimeout=1 -qt $h "PATH=$PATH:/usr/local/bin;$@"
done
echo "***"
echo "      FINISHED   ***"
