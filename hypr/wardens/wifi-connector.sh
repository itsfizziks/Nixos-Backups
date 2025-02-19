#!/bin/bash

# Scan for available networks
networks=$(nmcli -f SSID dev wifi list | tail -n +2)

# If networks are found, show them in wofi
if [[ -n "$networks" ]]; then
    selected=$(echo "$networks" | wofi --show run --dmenu --lines 10 --prompt "Select Wi-Fi Network:")

    if [[ -n "$selected" ]]; then
        # Attempt to connect to the network using nmcli
        selected=$(echo "$selected" | xargs)
        nmcli dev wifi connect "$selected" --ask
    fi
else
    echo "No networks found"
fi

