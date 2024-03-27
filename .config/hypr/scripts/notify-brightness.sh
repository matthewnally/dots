#!/bin/bash
# changeBrightness

# Arbitrary but unique message tag
msgTag="mybright"

# Change the volume using alsa(might differ if you use pulseaudio)
# amixer -c 0 set Master "$@" > /dev/null
if [[ "$1" == "down" ]] then
    light -U 5
elif [[ "$1" == "up" ]] then
    light -A 5
fi

# Query amixer for the current volume and whether or not the speaker is muted
brightness="$(light -G | cut -d'.' -f1 )"
dunstify -a "changeBrightness" -u low -i /usr/share/icons/Adwaita/symbolic/status/display-brightness-symbolic.svg  -h string:x-dunst-stack-tag:$msgTag -h int:value:"$brightness" "Brightness"

echo "heere"

