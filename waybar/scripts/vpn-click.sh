#!/usr/bin/env bash

vpn_status=$(mullvad status | cut -d ' ' -f1 | tr '[:upper:]' '[:lower:]')

if [[ "$vpn_status" = "connected" ]]; then
    mullvad disconnect
elif [[ "$vpn_status" = "disconnected" ]]; then
    mullvad connect
fi
