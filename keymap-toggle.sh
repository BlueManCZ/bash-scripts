#!/bin/bash

# Toggle keyboard keymap between eu and keymap in argument.

target_layout=$1
layout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')

if [ ! "$layout" ]
then
  notify-send "Please install \"setxkbmap\" package"
  exit
fi

if [ "$layout" = "$target_layout" ]
then
  setxkbmap eu
  notify-send "Using eu keymap"
else
  setxkbmap "$target_layout"
  notify-send "Using $target_layout keymap"
fi
