#!/bin/bash

sketchybar --add item battery right \
  --set battery update_freq=60 \
  script="$PLUGINS_DIR/battery.sh" \
  icon.padding_left=5 \
  label.padding_right=5 \
  padding_left=4 \
  padding_right=5

  --subscribe battery system_woke power_source_change
