#!/bin/bash

source=~/.config/hypr/themes/
style=~/.config/wofi/themes/$1.css

if [[ ! -f "$style" ]];
then
  notify-send "No wofi theme for $1"
fi

selected=$(ls $source -1 |wofi --dmenu $2 --style $style --hide-scroll --cache-file /dev/null)
if [[ -n "$selected" ]];
then
  sed -i '1d' ~/.config/hypr/hyprland.conf
  sed -i "1i\\\$THEME=$selected" ~/.config/hypr/hyprland.conf
fi
