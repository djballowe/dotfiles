#!/usr/bin/env bash

COLOR="%{F#A7C080}"
END="%{F-}"

solaar_source_path="/home/david/build/Solaar/bin/solaar"
battery_string=$("$solaar_source_path" show | sed -n '/1: MX Master 3S/,/Battery/p' | grep Battery)
battery_percent=$(echo "$battery_string" | awk '{sub(/%/, ""); sub(/,/, ""); print $2}')
battery_status=$(echo "$battery_string" | awk '{sub(/\./, " "); sub(/\./, ""); print $4}')

if [[ ! $battery_percent =~ ^[0-9]+$ ]]; then
    echo "$COLOR󰂃 $END--"
    exit 1
fi

icons=("󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")

if ((battery_percent == 100)); then
    icon="${icons[10]}"
else
    icon="${icons[$((battery_percent / 10))]}"
fi

if [ "$battery_status" == "RECHARGING" ]; then
    icon="󰂄"
fi

echo "$COLOR$icon$END $battery_percent%"
