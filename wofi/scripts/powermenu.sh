#!/bin/bash

entries=" Lock\n⭮ Reboot\n⏻ Shutdown\n⇠ Logout\n⏾ Suspend"
selected=$(echo -e $entries|wofi --width 750 --height 160 --dmenu -w 5 --style $HOME/.config/wofi/themes/$1.css --hide_search=true --hide-scroll --cache-file /dev/null | awk '{print tolower($2)}')
# selected=$(echo -e $entries|wofi --width 250 --height 380 --dmenu -w 5 --style $HOME/.config/wofi/themes/$1.css --hide_search=true --hide-scroll --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  lock)
    exec swaylock;;
  logout)
    exec hyprctl dispatch exit NOW;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
