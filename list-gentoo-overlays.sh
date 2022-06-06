#!/bin/bash

# List gentoo packages installed from overlays

OVERLAYS=$(layman --list-local | cut -d " " -f 3)
COUNT=$(echo "$OVERLAYS" | wc -w)

echo "You are subscribed to $COUNT overlays."

for OVERLAY in $OVERLAYS
do
	printf "\n%s" "$OVERLAY"
	PACKAGES=$(grep -l "$OVERLAY" /var/db/pkg/*/*/repository | cut -d "/" -f 5,6)

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
