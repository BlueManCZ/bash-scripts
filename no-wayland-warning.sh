#!/bin/sh

if [ "$XDG_SESSION_TYPE" != wayland ]
then
    notify-send "You are using $XDG_SESSION_TYPE" "Better switch to wayland"
fi
