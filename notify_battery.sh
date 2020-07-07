#!/bin/sh
/usr/bin/acpi -b | /usr/bin/awk -F'[,:%]' '{print $2, $3}' | {
    read -r status capacity

    if [ "$status" = Discharging -a "$capacity" -lt 7 ]; then
        /usr/bin/logger "Critical battery threshold"
        /usr/bin/dunstify -u critical 'Battery critical!' 'Hibernating'
    elif [ "$status" = Discharging -a "$capacity" -lt 10 ]; then
        /usr/bin/logger "Critical battery threshold"
        /usr/bin/dunstify -u critical '⚠️ Battery critical! ⚠️' 'Plugin your computer <i>now</i>'
    elif [ "$status" = Discharging -a "$capacity" -lt 15 ]; then
        /usr/bin/logger "Low battery threshold"
        /usr/bin/dunstify -u critical 'Battery low' 'Plugin your computer soon'
    fi
}
