#!/bin/sh

while true; do
    echo "Vol:" `amixer sget Master | grep '[0-9]\+%' -o` "|" "Mem:" `free -h | awk '/Mem/{print $3}'` "|" `date`
    sleep 1
done
