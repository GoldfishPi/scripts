#!/bin/bash

single_monitor="single"
dual_monitors="dual"

selection=`echo -e "$single_monitor\n$dual_monitors"| dmenu -p "Monitors: "`

# [ -z $selection ] && exit

if [ "$selection" == "$single_monitor" ] 
then
    exec xrandr --output DP-1 --off
fi

if [ "$selection" == "$dual_monitors" ] 
then
    exec xrandr --output DP-1 --auto --above eDP-1
fi
