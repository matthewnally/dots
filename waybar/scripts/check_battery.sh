#!/bin/sh

bat=/sys/class/power_supply/BAT0
CRIT=${1:-15}
echo $CRIT

FILE=~/.config/waybar/scripts/notified

stat=$(cat $bat/status)
perc=$(cat $bat/capacity)
echo $perc

if [[ $perc -le $CRIT ]] && [[ $stat == "Discharging" ]]; then
  if [[ ! -f "$FILE" ]]; then
    notify-send --urgency=critical --icon=dialog-warning "Battery Low" "Current charge: $perc%"
    touch $FILE
  fi
elif [[ -f "$FILE" ]]; then
  rm $FILE
fi
