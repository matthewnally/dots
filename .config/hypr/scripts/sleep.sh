#!/bin/sh
swayidle -w timeout 300 'swaylock -f' \
            timeout 600 'systemctl suspend' \
            before-sleep 'swaylock -f' &
