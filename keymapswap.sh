#!/bin/bash

layout=`setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}'`

if [ $layout = 'cz' ]
then
	setxkbmap eu
	notify-send "Anglická klávesnice nastavena"
else
	setxkbmap cz
	notify-send "Česká klávesnice nastavena"
fi
