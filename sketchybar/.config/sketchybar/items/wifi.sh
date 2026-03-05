#!/bin/bash

sketchybar --add item wifi right \
  --set wifi script="$PLUGINS_DIR/wifi.sh" \
  update_freq=15 \
  icon.padding_left=5 \
  label.padding_right=5 \
  padding_left=4 \
  padding_right=5 \
  --subscribe wifi wifi_change
