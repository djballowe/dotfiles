#!/usr/bin/env bash
source ~/code/github/dotfiles/script-vars

mullvad_status=$(mullvad status)
connection_status=$(echo "$mullvad_status" | cut -d ' ' -f1 | tr '[:upper:]' '[:lower:]')
location=$(echo "$mullvad_status" | grep location | cut -d ':' -f2 | cut -d '.' -f1)

if [[ "$connection_status" = "connected" ]]; then
    echo "<span color='#A7C080'></span> "$location""
elif [[ "$connection_status" = "disconnected" ]]; then
    echo "<span color='#A7C080'></span> "$location""
else
    mullvad_status=$(mullvad status | head -n 1)
    echo ""$mullvad_status""
fi
