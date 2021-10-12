#!/bin/bash

OVERLAYS=$(layman --list-local | cut -d " " -f 3)
COUNT=$(echo $OVERLAYS | wc -w)

echo "You are subscribed to $COUNT overlays."

for OVERLAY in $OVERLAYS
do
	printf "\n$OVERLAY"
	PACKAGES=$(grep -l $OVERLAY /var/db/pkg/*/*/repository | cut -d "/" -f 6)

	if [ ! "$PACKAGES" ]; then
		printf " [EMPTY]\n"
		continue
	fi

	echo

	for PACKAGE in $PACKAGES
	do
		echo " - $PACKAGE"
	done
done
