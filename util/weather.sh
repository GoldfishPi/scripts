#!/bin/bash
exec curl wttr.in/Minneapolis &
while [ true ] ; do
    read -t 3 -n 1
    if [ $? = 0 ] ; then
        exec curl wttr.in/ &
        # exit ;
    fi
done
