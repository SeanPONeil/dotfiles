#!/usr/bin/env bash

MBP_RETINA="67702892-17FD-6076-2C69-5FFBA2BAB607"
LG="3C42190A-8DAB-6B58-E6BC-6AF6739F4409"

query=$(yabai -m query --spaces)
focused_space=$(echo $query | jq '.[] | select(.focused == 1)')
display_index=$(echo $focused_space | jq '.display')

display=$(yabai -m query --displays | jq ".[] | select(.index == $display_index)")
uuid=$(echo $display | jq -r '.uuid')

if [[ $uuid == $MBP_RETINA ]]; then
  cd $HOME && alacritty --config-file $HOME/.config/alacritty/alacritty-retina.yml --print-events
else
  cd $HOME && alacritty
fi
