#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="myvolume"

# Change the volume using alsa(might differ if you use pulseaudio)
# amixer -c 0 set Master "$@" > /dev/null
mute="$(pulsemixer --get-mute)"
volume="$(pulsemixer --get-volume | awk '{print $1}')"
if [[ "$1" == "up" && $volume -lt 100 ]] then
    if [[ "$mute" == 1 ]] then
	pulsemixer --unmute
    fi

    pulsemixer --change-volume +5
elif [[ "$1" == "down" ]] then
    if [[ "$mute" == 1 ]] then
	pulsemixer --unmute
    fi
    pulsemixer --change-volume -5
elif [[ "$1" == "mute" ]] then
    pulsemixer --toggle-mute
fi

# Query amixer for the current volume and whether or not the speaker is muted
# volume="$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}')"
volume="$(pulsemixer --get-volume | awk '{print $1}')"
# volume="$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"
# mute="$(amixer -c 0 get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
# mute="$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}')"
mute="$(pulsemixer --get-mute)"
if [[ $volume == 0 || "$mute" == 1 ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i /usr/share/icons/Adwaita/symbolic/status/audio-volume-muted-symbolic.svg  -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"0" "Muted"
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i /usr/share/icons/Adwaita/symbolic/status/audio-volume-medium-symbolic.svg -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "${volume}%"
fi

# Play the volume changed sound
# canberra-gtk-play -i audio-volume-change -d "changeVolume"
