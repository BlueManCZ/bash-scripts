#!/bin/bash

# Calculates used RAM in percentages.

ram_free=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
ram_total=$(awk '/MemTotal/ {print $2}' /proc/meminfo)

ram_free=$(( ${ram_free#0} ))
ram_total=$(( ${ram_total#0} ))

ram_used=$(( ram_total - ram_free ))

echo $(( 100 * ram_used / ram_total ))'%'
