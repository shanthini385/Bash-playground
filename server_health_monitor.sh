#!/bin/bash
# Server Health Monitoring & Alerting
# This script checks CPU, memory, and disk usage.
# If any metric exceeds its threshold, an alert email is sent.

# Set thresholds
CPU_THRESHOLD=80      # in percent
MEM_THRESHOLD=80      # in percent
DISK_THRESHOLD=90     # in percent

# Email settings (modify these to your email)
ALERT_EMAIL="MAIL_ADDRESS"

# Function to send alert email
send_alert() {
    local message="$1"
    echo -e "$message" | mail -s "Server Health Alert" "$ALERT_EMAIL"
}

# Get CPU usage (average over 1 iteration)
cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
cpu_usage=$(echo "scale=2; 100 - $cpu_idle" | bc)

# Get Memory usage (as percentage)
mem_usage=$(free | grep Mem | awk '{printf("%.0f", $3/$2 * 100)}')

# Get Disk usage for the root filesystem
disk_usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

alert_message=""

if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
    alert_message+="CPU usage is high: ${cpu_usage}%\n"
fi

if (( $(echo "$mem_usage > $MEM_THRESHOLD" | bc -l) )); then
    alert_message+="Memory usage is high: ${mem_usage}%\n"
fi

if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
    alert_message+="Disk usage is high: ${disk_usage}%\n"
fi

if [ -n "$alert_message" ]; then
    send_alert "Alert! Issues detected on the server:\n\n$alert_message"
fi

# logging purposes
echo "$(date): CPU=${cpu_usage}% MEM=${mem_usage}% DISK=${disk_usage}%" >> /var/log/server_health.log
