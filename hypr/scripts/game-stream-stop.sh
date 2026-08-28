#!/usr/bin/env bash

readonly BIG_PICTURE_TITLE="Steam Big Picture Mode"

big_picture_is_open() {
    hyprctl clients | grep -Fq "title: $BIG_PICTURE_TITLE"
}

# Close Steam Big Picture before removing its display
if big_picture_is_open; then
    setsid -f steam steam://close/bigpicture

    for _ in {1..50}; do
        if ! big_picture_is_open; then
            break
        fi

        sleep 0.2
    done
fi

# Return focus to the local Steam workspace
hyprctl dispatch \
    'hl.dsp.focus({ workspace = "5" })'

if hyprctl monitors | grep -q "Monitor STREAM"; then
    hyprctl output remove STREAM
fi
