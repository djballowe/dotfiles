#!/usr/bin/env bash
set -e

readonly BIG_PICTURE_TITLE="Steam Big Picture Mode"

big_picture_is_open() {
    hyprctl clients | grep -Fq "title: $BIG_PICTURE_TITLE"
}

# Create the virtual Sunshine display
if ! hyprctl monitors | grep -q "Monitor STREAM"; then
    hyprctl output create headless STREAM
    sleep 0.5
fi

# 16:10 120 Hz display
hyprctl eval \
    'hl.monitor({ output = "STREAM", mode = "2560x1600@120", position = "3840x0", scale = 1 })'

# workspace 9
hyprctl eval \
    'hl.workspace_rule({ workspace = "9", monitor = "STREAM", default = true, persistent = true })'

# workspace 9 on STREAM
hyprctl dispatch \
    'hl.dsp.workspace.move({ workspace = "9", monitor = "STREAM" })'

# Open Steam Big Picture and move its window to the streaming workspace
setsid -f steam steam://open/bigpicture

for _ in {1..50}; do
    if big_picture_is_open; then
        hyprctl dispatch \
            "hl.dsp.window.move({ workspace = \"9\", follow = false, window = \"title:^($BIG_PICTURE_TITLE)$\" })"
        hyprctl dispatch \
            'hl.dsp.focus({ workspace = "9" })'
        exit 0
    fi

    sleep 0.2
done

echo "Timed out waiting for $BIG_PICTURE_TITLE" >&2
exit 1
