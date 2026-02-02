#!/usr/bin/env bash

disc_title=$(lsblk -f | grep sr0 | tr -s ' ' ',' | cut -d',' -f4)

if [[ "$disc_title" == "" ]]; then
    eject -t /dev/sr0
else
    eject /dev/sr0
fi
