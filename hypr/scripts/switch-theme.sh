#!/bin/sh

# getting json config values
THEME_CONFIG="~/.config/hypr/themes/$1/$1.json"
COLOR_SCHEME=$(cat ~/.config/hypr/themes/$1/$1.json | jq -r ".colorScheme")

# wallpaper
killall hyprpaper
hyprpaper -c ~/.config/hypr/hyprpaper/$COLOR_SCHEME.conf &

# Change Waybar output depending on monitor
# source ~/.config/hypr/scripts/detect-outputs.sh
# sed -i -E 's/("output": ")(.*)(",)/\1'"$MAIN_DISPLAY"'\3/g' ~/.config/waybar/$COLOR_SCHEME/config

# waybar
echo "Starting waybar"
killall waybar
waybar --config ~/.config/waybar/$COLOR_SCHEME/config --style ~/.config/waybar/$COLOR_SCHEME/style.css &

# gtk theme
sh ~/.config/hypr/scripts/set-gtk-theme.sh $GTK_THEME


# font
gsettings set org.gnome.desktop.interface font-name "$FONT"
sed -i -E 's/(fixed=")(.*)(,.*,.*,.*,.*,.*,.*,.*,.*,.*,.*)/\1'"$FONT"'\3/g' ~/.config/qt5ct/qt5ct.conf
sed -i -E 's/(general=")(.*)(,.*,.*,.*,.*,.*,.*,.*,.*,.*,.*)/\1'"$FONT"'\3/g' ~/.config/qt5ct/qt5ct.conf

