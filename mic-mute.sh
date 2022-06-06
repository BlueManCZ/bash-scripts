#!/bin/bash

# Toggle microphone mute status.
# Takes two optional arguments for muting and un-muting audio notifications.

pactl set-source-mute @DEFAULT_SOURCE@ toggle

export LC_ALL=C
CURRENT_SOURCE=$(pactl info | grep "Default Source" | cut -f3 -d" ")
STATUS=$(pactl list sources | grep -A 10 "$CURRENT_SOURCE" | grep "Mute" | cut -f2 | cut -f2 -d' ' | head -n 1)

if [ "$STATUS" = yes ]
then
  if [ "$1" ]; then mpv "$1"; fi
else
	if [ "$2" ]; then mpv "$2"; fi
fi
