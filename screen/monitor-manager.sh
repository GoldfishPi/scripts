#!/bin/bash

single_monitor="1"
dual_monitors="2"

selection=`echo -e "$single_monitor\n$dual_monitors"| dmenu -p "Monitors: "`

# [ -z $selection ] && exit

if [ "$selection" == "$single_monitor" ] 
then
    exec xrandr --output DP1 --off
fi

if [ "$selection" == "$dual_monitors" ] 
then
    exec xrandr --output DP1 --auto --right-of eDP1
fi
