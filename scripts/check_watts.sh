while true; do
    awk '{print $1*1e-6 " W"}' /sys/class/power_supply/BAT1/power_now
    sleep 0.3

done
