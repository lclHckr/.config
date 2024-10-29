#!/bin/bash
ssid="$1"
password="$2"

nmcli connection delete "$ssid"
if nmcli dev wifi connect "$ssid" password "$password"; then
    echo "Successfully connected to $ssid"
else
    echo "Failed to connect to $ssid" >&2
    exit 1
fi
