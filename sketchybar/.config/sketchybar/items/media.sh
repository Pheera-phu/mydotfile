#!/bin/bash

sketchybar --add item media center \
  --set media label.color=0xffffffff \
  label.max_chars=60 \
  icon.padding_left=0 \
  scroll_texts=on \
  icon=􀑪 \
  icon.color=0xffffffff \
  background.drawing=off \
  drawing=on \
  script="$PLUGINS_DIR/media.sh" \
  --subscribe media media_change
