#!/bin/bash

bat_status=$(cat /sys/class/power_supply/BAT1/status)
# if [ "$bat_status" = "Full" ]; then
#     notify-send --urgency=NORMAL "Battery fully charged" -r 9999
# fi

bat_level=$(cat /sys/class/power_supply/BAT1/capacity)
if [ "$bat_level" -le 10 ] && [ "$bat_status" = "Discharging" ]; then
    notify-send --urgency=CRITICAL "Low battery ("${bat_level}%")" -r 9999
fi

