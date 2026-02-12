#!/bin/bash
echo "Time,Battery_Percent,Discharge_Rate_W,CPU_Temp,CPU_Usage" >youtube_bench.csv

echo "Starting Benchmark... Watch YouTube now!"
echo "Press CTRL+C to stop."

while true; do
  # Get Time
  TIMESTAMP=$(date +%T)

  # Get Battery % (adjust path if needed, check /sys/class/power_supply/BAT0 or BAT1)
  BAT_PCT=$(cat /sys/class/power_supply/BAT*/capacity | head -n 1)

  # Get Discharge Rate (Watts) - usually in microWatts, so divide by 1000000
  POWER_NOW=$(cat /sys/class/power_supply/BAT*/power_now | head -n 1)
  WATTS=$(echo "scale=2; $POWER_NOW / 1000000" | bc)

  # Get Temp (Tctl or package)
  TEMP=$(sensors | grep "Tctl" | awk '{print $2}' | tr -d '+°C')

  # Get CPU Usage (Total)
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

  echo "$TIMESTAMP,$BAT_PCT,$WATTS,$TEMP,$CPU_USAGE" >>youtube_bench.csv
  sleep 2
done
