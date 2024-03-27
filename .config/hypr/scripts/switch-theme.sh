#!/bin/sh

# getting json config values

THEME=$1
# wallpaper
killall hyprpaper
hyprpaper -c ~/.config/hypr/themes/$THEME/hyprpaper.conf &

# Change Waybar output depending on monitor
# source ~/.config/hypr/scripts/detect-outputs.sh
# sed -i -E 's/("output": ")(.*)(",)/\1'"$MAIN_DISPLAY"'\3/g' ~/.config/waybar/$COLOR_SCHEME/config

# waybar
echo "Starting waybar"
killall waybar
waybar --config ~/.config/waybar/$THEME/config --style ~/.config/waybar/$THEME/style.css &




