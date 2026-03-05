#!/bin/bash

# Get the Wi-Fi interface
WIFI_DEVICE=$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $2}')

# Get the network name
SSID=$(networksetup -getairportnetwork "$WIFI_DEVICE" | sed 's/Current Wi-Fi Network: //')

# Check if Wi-Fi is off
if ! networksetup -getairportpower "$WIFI_DEVICE" | grep -q "On"; then
  sketchybar --set $NAME label="Wi-Fi Off" icon="􀙈"
elif [[ "$SSID" == "You are not associated with an AirPort network."* || -z "$SSID" ]]; then
  sketchybar --set $NAME label="Disconnected" icon="􀙈"
else
  sketchybar --set $NAME label="$SSID" icon="􀙇"
fi
