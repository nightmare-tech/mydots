#!/usr/bin/bash
var=$(powerprofilesctl list | grep "^\* " | awk '{print $2}')

case "$var" in
    *balanced*)
        echo "Executing command for balanced profile"
        powerprofilesctl set performance
        notify-send "Performance" -a "PowerCycle"
        ;;
    *power-saver*)
        echo "Executing command for power-saver profile"
        powerprofilesctl set balanced
        notify-send "Balanced" -a "PowerCycle"
        ;;
    *performance*)
        echo "Executing command for performance profile"
        powerprofilesctl set power-saver
        notify-send "Power Saver" -a "PowerCycle"  
        ;;
    *)
        echo "Error: Unknown power profile"
        ;;
esac
