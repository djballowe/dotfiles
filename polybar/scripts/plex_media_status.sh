#!/usr/bin/env bash
source ~/.config/i3/script-vars

status=$(mullvad-exclude ssh -i "$SERVER_SSH_KEY_PATH" "$SERVER_USER"@"$SERVER_IP" -p "$SERVER_SSH_PORT" "df -hT" | grep fuse.mergerfs | tr -s ' ' | cut -d' ' -f5)

echo "$status"
