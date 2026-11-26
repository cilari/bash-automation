#!/usr/bin/env bash
set -euo pipefail

echo "===== System Health Report: $(date) ====="

echo ""
echo "-- Disk Usage --"
df -h | grep -v tmpfs

echo ""
echo "-- Memory Usage --"
if [[ "$OSTYPE" == "darwin"* ]]; then
    vm_stat
else
    free -h
fi

echo ""
echo "-- Top 5 Proeccesses by CPU --"
if [[ "$OSTYPE" == "darwin"* ]]; then
    ps aux -r | head -6 || true
else
    ps aux --sort=-%cpu | head -6 || true
fi

echo ""
echo "-- Uptime --"
uptime
