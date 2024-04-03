#!/bin/bash
# changeBrightness

# Arbitrary but unique message tag
msgTag="mybright"

# Change the volume using alsa(might differ if you use pulseaudio)
# amixer -c 0 set Master "$@" > /dev/null
if [[ "$1" == "down" ]] then
    brightnessctl s 5%-
elif [[ "$1" == "up" ]] then
    brightnessctl s 5%+
fi

# Query amixer for the current volume and whether or not the speaker is muted
# brightness="$(brightnessctl g | cut -d'.' -f1 )"
brightness="$(($(brightnessctl g)*100 / $(brightnessctl m)))"
dunstify -a "changeBrightness" -u low -i /usr/share/icons/Adwaita/symbolic/status/display-brightness-symbolic.svg  -h string:x-dunst-stack-tag:$msgTag -h int:value:"$brightness" "Brightness"

