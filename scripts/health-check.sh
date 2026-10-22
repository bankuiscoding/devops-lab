#!/bin/bash

echo "==== System Health Check ===="
echo ""

echo "1. Current date and time:"
date

echo ""
echo "2. System uptime:"
uptime

echo ""
echo "3. Disk usage:"
df -h /

disk_usage=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo ""
echo "4. Disk space status:"

if [ "$disk_usage" -ge 80 ]; then
    echo "WARNING: Disk usage is ${disk_usage}%"
else
    echo "OK: Disk usage is ${disk_usage}%"
fi

echo ""
echo "5. Memory usage:"
free -h

echo ""
echo "==== CHECK COMPLETE ===="
