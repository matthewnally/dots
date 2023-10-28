#!/bin/bash
# changeVolume

# Arbitrary but unique message tag
msgTag="myvolume"

# Change the volume using alsa(might differ if you use pulseaudio)
# amixer -c 0 set Master "$@" > /dev/null
mute="$(pactl get-sink-mute @DEFAULT_SINK@ | sed 's/.* //g')"
volume="$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}')"
if [[ "$1" == "up" && $volume -lt 100 ]] then
    if [[ "$mute" == "yes" ]] then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
    fi

    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [[ "$1" == "down" ]] then
    if [[ "$mute" == "yes" ]] then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
    fi
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [[ "$1" == "mute" ]] then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}')"
# volume="$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"
# mute="$(amixer -c 0 get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
# mute="$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}')"
mute="$(pactl get-sink-mute @DEFAULT_SINK@ | sed 's/.* //g')"
if [[ $volume == 0 || "$mute" == "yes" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i /usr/share/icons/Adwaita/32x32/status/audio-volume-muted-symbolic.symbolic.png  -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Muted" -h string:hlcolor:#2d353b
    else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i /usr/share/icons/Adwaita/32x32/status/audio-volume-medium-symbolic.symbolic.png -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "${volume}%" -h string:hlcolor:#2d353b
fi

# Play the volume changed sound
# canberra-gtk-play -i audio-volume-change -d "changeVolume"
