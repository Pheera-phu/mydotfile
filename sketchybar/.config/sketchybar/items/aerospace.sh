#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in 1 2 3 4 5 6 7 8 9; do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    background.color=0x44ffffff \
    background.corner_radius=5 \
    background.height=17 \
    background.drawing=off \
    label="$sid" \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid" \
    icon.drawing=off \
    label.align=center \
    label.padding_left=6 \
    label.padding_right=6
done
