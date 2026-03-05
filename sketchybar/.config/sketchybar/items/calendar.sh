#!/bin/bash

sketchybar --add item calendar right \
  --set calendar icon=􀉉  \
  update_freq=30 \
  icon.padding_left=5 \
  label.padding_right=5 \
  padding_left=4 \
  padding_right=5 \
  script="$PLUGINS_DIR/calendar.sh"
    
