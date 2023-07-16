#!/usr/bin/env bash

CPU="00.00%"
VOL="00%"
MEM="000Mi"
DATE=$(date)

while true; do
    echo "VOL:" $VOL "|" "CPU:" $CPU "|" "MEM:" $MEM "|" $DATE

    CPU=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1; grep 'cpu ' /proc/stat) | xargs printf "%05.2f%%")
    VOL=$(amixer sget Master | grep '[0-9]\+%' -o)
    MEM=$(free -h | awk '/Mem/{print $3}')
    DATE=$(date)
done
