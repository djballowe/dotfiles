#!/usr/bin/env bash
set -e

# Create the virtual Sunshine display
if ! hyprctl monitors | grep -q "Monitor STREAM"; then
    hyprctl output create headless STREAM
    sleep 0.5
fi

# 16:10 120 Hz display
hyprctl keyword monitor STREAM,2560x1600@120,3840x0,1

# workspace 9 
hyprctl keyword workspace "9,monitor:STREAM,default:true,persistent:true"

# workspace 9 on STREAM
hyprctl dispatch moveworkspacetomonitor 9 STREAM
