#!/usr/bin/bash
var=$(powerprofilesctl list | grep "^\* " | awk '{print $2}')

case "$var" in
    *balanced*)
        echo "Executing command for balanced profile"
        powerprofilesctl set performance
        notify-send -t 600 "Performance" -a "PowerCycle"
        ;;
    *power-saver*)
        echo "Executing command for power-saver profile"
        powerprofilesctl set balanced
        notify-send -t 600"Balanced" -a "PowerCycle"
        ;;
    *performance*)
        echo "Executing command for performance profile"
        powerprofilesctl set power-saver
        notify-send -t 600 "Power Saver" -a "PowerCycle"  
        ;;
    *)
        echo "Error: Unknown power profile"
        ;;
esac
