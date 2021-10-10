#!/bin/bash

MAC=$1

if [ ! ${MAC} ]; then
    echo "Please pass MAC address as an argument."
    exit
fi

powered() {
    echo "show" | bluetoothctl | grep "Powered" | cut -d " " -f 2
}

connected() {
    echo "info ${MAC}" | bluetoothctl | grep "Connected" | cut -d " " -f 2
}

while true
do
    sleep 1
    if [ $(powered) = yes ] && [ $(connected) = no ]; then
        echo "connect ${MAC}" | bluetoothctl
        sleep 5
    fi
done
