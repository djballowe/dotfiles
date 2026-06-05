#!/usr/bin/env bash
source ~/code/github/dotfiles/script-vars

status=$(df -hT | grep /dev/sdc3 | tr -s ' ' | cut -d' ' -f5)

echo "$status"
