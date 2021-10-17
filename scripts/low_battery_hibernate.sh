#!/bin/sh

/usr/bin/acpi -b | /usr/bin/awk -F'[,:%]' '{print $2, $3}' | {
    read -r status capacity

    if [ "$status" = Discharging -a "$capacity" -lt 5 ]; then
        /usr/bin/systemctl hibernate
    fi
}