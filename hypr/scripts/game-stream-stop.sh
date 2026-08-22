#!/usr/bin/env bash

if hyprctl monitors | grep -q "Monitor STREAM"; then
    hyprctl output remove STREAM
fi
