#!/usr/bin/env bash

last_video=""

while true; do
    current=$(playerctl metadata xesam:url 2>/dev/null)

    if [[ -n "$current" && "$current" != "$last_video" && "$current" == *"youtube.com"* ]]; then
        echo "$current"

        ~/.config/practice/change_color1.sh

        last_video="$current"
    fi

    sleep 2
done