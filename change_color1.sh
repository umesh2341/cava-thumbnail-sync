#!/usr/bin/env bash
video_url=$(playerctl metadata xesam:url 2>/dev/null)

if [[ "$video_url" != *"youtube.com"* ]]; then
    exit 1
fi

video_id=$(echo "$video_url" | grep -oP 'v=\K[^&]+')

thumbnail_url="https://img.youtube.com/vi/$video_id/maxresdefault.jpg"
thumbnail_path="/tmp/yt-thumb.jpg"

curl -s -o "$thumbnail_path" "$thumbnail_url"

colors=$(convert "$thumbnail_path" -resize 50x50 -colors 9 -unique-colors txt:- \
| awk -F' ' '/#/ {print $3}' | head -n 9)

color1=$(echo "$colors" | sed -n '1p')
color2=$(echo "$colors" | sed -n '2p')
color3=$(echo "$colors" | sed -n '3p')
color4=$(echo "$colors" | sed -n '4p')
color5=$(echo "$colors" | sed -n '5p')
color6=$(echo "$colors" | sed -n '6p')
color7=$(echo "$colors" | sed -n '7p')
color8=$(echo "$colors" | sed -n '8p')
color9=$(echo "$colors" | sed -n '9p')


config="$HOME/.config/cava/config"

sed -i "s/gradient_color_1.*/gradient_color_1 = '$color2'/" "$config"
sed -i "s/gradient_color_2.*/gradient_color_2 = '$color3'/" "$config"
sed -i "s/gradient_color_3.*/gradient_color_3 = '$color4'/" "$config"
sed -i "s/gradient_color_4.*/gradient_color_4 = '$color5'/" "$config"
sed -i "s/gradient_color_5.*/gradient_color_5 = '$color6'/" "$config"
sed -i "s/gradient_color_6.*/gradient_color_6 = '$color7'/" "$config"
sed -i "s/gradient_color_7.*/gradient_color_7 = '$color8'/" "$config"
sed -i "s/gradient_color_8.*/gradient_color_8 = '$color9'/" "$config"

pkill cava 2>/dev/null


