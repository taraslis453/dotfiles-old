#!/bin/bash
current=`setxkbmap -query | grep layout|cut -d ',' -f 2`

if [ "$current" == "ua" ]
then 
    notify-send -t 500 -i keyboard "Keyboard layouts: US/RU"
    setxkbmap -layout us,ru
    setxkbmap -option 'grp:alt_shift_toggle'
else 
    notify-send -t 500 -i keyboard "Keyboard layouts: US/UA"

    setxkbmap -layout us,ua
    setxkbmap -option 'grp:alt_shift_toggle'
fi
