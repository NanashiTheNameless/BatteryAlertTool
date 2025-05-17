#!/bin/bash

timeInbetweenAlerts=10
batteryPercentAlert=20

alertSoundMac=/System/Library/Sounds/Funk.aiff
alertSoundLinux=/usr/share/sounds/common/battery-low.ogg

# If you need to override system type (Ex. system doesnt have "uname" available)
# You can manually override this to "Darwin" for mac or "Linux" for Lipnux
systemType=$(uname)

# This is from https://github.com/NanashiTheNameless/BatteryAlertTool
# It is licensed under https://github.com/NanashiTheNameless/BatteryAlertTool/blob/main/license.md

while true; do
    if [[ "$systemType" == "Darwin" ]]; then
        if pmset -g batt | head -n 1 | grep -i -q "Battery" && [ $(pmset -g batt | grep -i -o '[0-9]\{1,3\}%' | tr -d '%') -le $batteryPercentAlert ]; then
            afplay $alertSoundMac
        fi
    else
        batteryInfo=$(upower -i $(upower -e | grep -i BAT))
        batteryPercent=$(echo "$batteryInfo" | grep -i -o -P 'percentage:\s+\K\d+')
        chargingState=$(echo "$batteryInfo" | grep -i -o -P 'state:\s+\K\w+')

        if [[ "$chargingState" == "discharging" && $batteryPercent -le $batteryPercentAlert ]]; then
            paplay $alertSoundLinux
        fi
    fi

    sleep $timeInbetweenAlerts
done