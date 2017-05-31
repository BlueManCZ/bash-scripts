#!/bin/bash

id=`xwininfo | grep 'Window id:' | awk '{ print $4; }'`
while true
do
  xdotool key --window $id F5
  sleep 1
done
